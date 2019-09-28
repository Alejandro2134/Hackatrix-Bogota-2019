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
<<<<<<< HEAD
=======
router.get("/header", (req,res) => {
  res.render('pages/partials/header')
})

=======
<<<<<<< HEAD
>>>>>>> 597480993a8a129ac70827e11f85b304c4b4f421
router.get("/abogado", (req, res) => {
  res.render('pages/vistaAbogado')
})

=======
>>>>>>> b476b73db920470040d3ff776a2134d0cb67bcc1
<<<<<<< HEAD
=======
>>>>>>> bd2567a1f43dcd65ddec8226104f852b7f6a7ead
>>>>>>> 597480993a8a129ac70827e11f85b304c4b4f421
module.exports = router;
