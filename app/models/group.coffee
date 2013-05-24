'use strict'

angular.module('rubynas-admin.group', ['ngResource'])

.factory 'Group', ($resource) ->
  $resource '/api/groups/:cn', {}, 
    update:
      method: 'PUT'
