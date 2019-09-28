'use strict'

const config = {
  user: process.env.DB_USER || 'root',
  password: process.env.DB_BASS || '',
  host: process.env.DB_HOST || 'localhost',
  database: process.env.DB_NAME || 'Voitea'
}

module.exports = config
