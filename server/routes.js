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

router.get("/fAbogado", (req, res) => {
  res.render('pages/formularioAbogado')
})

router.get("/abogado", (req, res) => {
  res.render('pages/vistaAbogado')
})

router.get("/fEstudiante", (req, res) => {
  res.render('pages/formularioEstudiante')
})

router.get("/header", (req,res) => {
  res.render('pages/partials/header')
})

router.get("/abogado", (req, res) => {
  res.render('pages/vistaAbogado')
})

module.exports = router;
