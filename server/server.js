'use strict'

const express = require('express')
const app = express()
const routes = require('./routes')

//Motor de plantillas EJS 
app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, 'views'))

