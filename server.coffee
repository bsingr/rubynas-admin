mock_all = (name) ->
  return (req, res) ->
    res.sendfile './api-mock/'+name+'.json'
mock_by_id = (name) ->
  return (req, res) ->
    found = require('./api-mock/'+name+'.json').filter (obj) ->
      obj.id.toString() == req.params.id
    if found.length
      res.send 200, found[0]
    else
      res.send 404, {}

express = require 'express'
app = express()

app.use(express.static __dirname+'/_public')

exports.startServer = (port, path, callback) ->
  app.get '/', (req, res) -> res.sendfile './_public/index.html'
  app.get '/api/system/vmstat', mock_all('vmstat')
  app.get '/api/users', mock_all('users')
  app.get '/api/users/:id', mock_by_id('users')
  app.get '/api/groups', mock_all('users')
  app.get '/api/groups/:id', mock_by_id('users')
  app.get '/api/volumes', mock_all('volumes')
  app.get '/api/volumes/:id', mock_by_id('volumes')
    
  app.listen port
  console.log 'Listening on port: '+port
