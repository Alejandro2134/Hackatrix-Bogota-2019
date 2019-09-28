'use strict'

const express = require('express')
const router = express.Router()
//const db = require('Bd')

router.get('/', (req, res) => {
  res.render('pages/index')
})

module.exports = router;