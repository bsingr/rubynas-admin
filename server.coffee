express = require 'express'
app = express()

app.use(express.static __dirname+'/_public')

exports.startServer = (port, path, callback) ->
  app.get '/', (req, res) -> res.sendfile './_public/index.html'
  app.get '/api/system/vmstat', (req, res) -> res.sendfile './api-mock/vmstat.json'
  app.get '/api/users', (req, res) -> res.sendfile './api-mock/users.json'
  app.get '/api/users/:id', (req, res) -> res.sendfile './api-mock/users.json'
  app.get '/api/groups', (req, res) -> res.sendfile './api-mock/users.json'
  app.get '/api/groups/:id', (req, res) -> res.sendfile './api-mock/users.json'
  app.get '/api/volumes', (req, res) -> res.sendfile './api-mock/volumes.json'
  app.get '/api/volumes/:id', (req, res) -> res.sendfile './api-mock/volumes.json'
  app.listen port
  console.log 'Listening on port: '+port
