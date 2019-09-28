'use strict'

const express = require('express')
const router = express.Router()
//const db = require('Bd')

router.get('/', (req, res) => {
  res.render('pages/index')
})

router.get("/usuario", (req, res) => {
  res.render('pages/usuario')
})



router.get("/header", (req,res) => {
  res.render('pages/partials/header')
})


router.get("/abogado", (req, res) => {
  res.render('pages/vistaAbogado')
})



module.exports = router;
