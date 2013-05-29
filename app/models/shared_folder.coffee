'use strict'

angular.module('rubynas-admin.shared_folder', ['ngResource'])

.factory 'SharedFolder', ($resource) ->
  $resource '/api/shared_folders/:id', {}, 
    update:
      method: 'PUT'
