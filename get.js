 
module.exports = {
  addGetListener: function (app) {

    app.get('/', function (req, res) {
      res.render('home')
    })

    app.get('/aboutme', function (req, res) {
      res.render('aboutme')
    })


  }
}
