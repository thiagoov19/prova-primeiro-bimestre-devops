const express = require('express');
const { pool, init } = require('./db');

const app = express();
app.use(express.json());

// repassa erros de funções async para o middleware de erro
const wrap = fn => (req, res, next) => Promise.resolve(fn(req, res, next)).catch(next);
const idValido = id => /^\d+$/.test(id);

app.get('/health', (_req, res) => res.json({ status: 'ok' }));

app.post('/reservas', wrap(async (req, res) => {
  const { cliente, data, status = 'pendente' } = req.body;
  if (!cliente || !data) {
    return res.status(400).json({ erro: 'cliente e data são obrigatórios' });
  }
  const { rows } = await pool.query(
    'INSERT INTO reservas (cliente, data, status) VALUES ($1,$2,$3) RETURNING *',
    [cliente, data, status]);
  res.status(201).json(rows[0]);
}));

app.get('/reservas', wrap(async (_req, res) => {
  const { rows } = await pool.query('SELECT * FROM reservas ORDER BY id');
  res.json(rows);
}));

app.get('/reservas/:id', wrap(async (req, res) => {
  if (!idValido(req.params.id)) return res.status(400).json({ erro: 'id inválido' });
  const { rows } = await pool.query('SELECT * FROM reservas WHERE id=$1', [req.params.id]);
  if (!rows.length) return res.status(404).json({ erro: 'Reserva não encontrada' });
  res.json(rows[0]);
}));

app.put('/reservas/:id', wrap(async (req, res) => {
  if (!idValido(req.params.id)) return res.status(400).json({ erro: 'id inválido' });
  const { cliente, data, status } = req.body;
  if (!cliente || !data || !status) {
    return res.status(400).json({ erro: 'cliente, data e status são obrigatórios' });
  }
  const { rows } = await pool.query(
    'UPDATE reservas SET cliente=$1, data=$2, status=$3 WHERE id=$4 RETURNING *',
    [cliente, data, status, req.params.id]);
  if (!rows.length) return res.status(404).json({ erro: 'Reserva não encontrada' });
  res.json(rows[0]);
}));

app.delete('/reservas/:id', wrap(async (req, res) => {
  if (!idValido(req.params.id)) return res.status(400).json({ erro: 'id inválido' });
  const { rowCount } = await pool.query('DELETE FROM reservas WHERE id=$1', [req.params.id]);
  if (!rowCount) return res.status(404).json({ erro: 'Reserva não encontrada' });
  res.status(204).send();
}));

// middleware de erro (deve ficar depois das rotas)
app.use((err, _req, res, _next) => {
  if (err.type === 'entity.parse.failed') return res.status(400).json({ erro: 'JSON inválido' });
  if (err.code && String(err.code).startsWith('22')) return res.status(400).json({ erro: 'Dados inválidos (verifique a data)' });
  console.error(err);
  res.status(500).json({ erro: 'Erro interno' });
});

init().then(() => {
  app.listen(3000, () => console.log('API de Reservas na porta 3000'));
}).catch(e => { console.error(e); process.exit(1); });
