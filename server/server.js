'use strict'

const express = require('express')
const app = express()
const routes = require('./routes')

//Motor de plantillas EJS 
app.set('view engine', 'ejs')
app.set('views', path.join(__dirname, 'views'))

// defincion de archivos publicos del servidor
app.use(express.static('public'))
// agregador de rutas al server
app.use('/', routes)

const port = process.env.PORT || 3000
app.listen(port, (err) => {
  if (err) throw err
  console.log('server runnig  http://localhost:3000/')
})

