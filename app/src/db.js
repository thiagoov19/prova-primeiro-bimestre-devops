const { Pool } = require('pg');

const pool = new Pool({
  host: process.env.DB_HOST || 'localhost',
  port: Number(process.env.DB_PORT || 5432),
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  // RDS PostgreSQL 15+ exige SSL
  ssl: process.env.DB_SSL === 'true' ? { rejectUnauthorized: false } : false,
});

async function init(retries = 10) {
  for (let i = 0; i < retries; i++) {
    try {
      await pool.query(`
        CREATE TABLE IF NOT EXISTS reservas (
          id SERIAL PRIMARY KEY,
          cliente VARCHAR(120) NOT NULL,
          data DATE NOT NULL,
          status VARCHAR(30) NOT NULL DEFAULT 'pendente'
        )`);
      return;
    } catch (e) {
      console.log(`Aguardando banco... (${i + 1}/${retries}) ${e.message}`);
      await new Promise(r => setTimeout(r, 3000));
    }
  }
  throw new Error('Banco indisponível');
}

module.exports = { pool, init };
