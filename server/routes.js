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

<<<<<<< HEAD
router.get("/header", (req,res) => {
  res.render('pages/partials/header')
})

=======
<<<<<<< HEAD
router.get("/abogado", (req, res) => {
  res.render('pages/vistaAbogado')
})

=======
>>>>>>> b476b73db920470040d3ff776a2134d0cb67bcc1
>>>>>>> bd2567a1f43dcd65ddec8226104f852b7f6a7ead
module.exports = router;
