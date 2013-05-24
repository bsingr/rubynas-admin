mock_all = (name) ->
  return (req, res) ->
    res.sendfile './api-mock/'+name+'.json'
mock_by_id = (name, id_key) ->
  id_key = 'id' unless id_key
  return (req, res) ->
    found = require('./api-mock/'+name+'.json').filter (obj) ->
      obj[id_key].toString() == req.params.id
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
  app.get '/api/users/:id', mock_by_id('users', 'common_name')
  app.get '/api/groups', mock_all('groups')
  app.get '/api/groups/:id', mock_by_id('groups', 'common_name')
  app.get '/api/volumes', mock_all('volumes')
  app.get '/api/volumes/:id', mock_by_id('volumes')
  app.listen port
  console.log 'Listening on port: '+port
