'use strict'

angular.module('rubynas-admin.volume', ['ngResource'])

.factory 'Volume', ($resource) ->
  $resource '/api/volumes/:id', {}, 
    update:
      method: 'PUT'
