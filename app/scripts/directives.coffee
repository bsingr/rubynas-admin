'use strict'

### Directives ###

# register the module with Angular
angular.module('rubynas-admin.directives', [
  # require the 'app.service' module
  'rubynas-admin.services'
])

.directive('appVersion', [
  'version'

(version) ->

  (scope, elm, attrs) ->
    elm.text(version)
])
