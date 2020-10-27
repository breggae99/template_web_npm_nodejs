const express = require('express')
const session = require("express-session")
const bodyParser = require("body-parser")
const path = require("path")

const hostname = '127.0.0.1'
const port = 3001

const app = express()

app.use(session({
  uid: undefined,
  secret: "This should be a secrete string",
  cookie: { maxAge: 30 * 24 * 60 * 60 * 1000 }, // Cookie expires after 30 days
  resave: false, //save only on change
  saveUninitialized: false
}))

// to decode POST
app.use(bodyParser.urlencoded({ extended: false }))

// Link path
app.use(express.static(path.join(__dirname, 'server', 'public')))
app.use(express.static(path.join(__dirname, 'node_modules')))

app.set()
// load view engine
app.set("views", path.join(__dirname, 'server', 'views'))
app.set("view engine", "pug");

// GET and POST listener's
require(path.resolve(__dirname, 'get.js')).addGetListener(app)
require(path.resolve(__dirname, 'post.js')).addPostListener(app)


app.listen(port, hostname, () => {
  console.log(`Server running at http://${hostname}:${port}/`);
});