'use strict'

# Declare app level module which depends on filters, and services
RubynasAdmin = angular.module('rubynas-admin', [
  'httpError'
  'ngCookies'
  'ngResource'
  'bytes'
  'jquery.timeago'
  'rubynas-admin.controllers'
  'rubynas-admin.directives'
  'rubynas-admin.filters'
  'rubynas-admin.services'
  'rubynas-admin.user'
  'rubynas-admin.group'
  'rubynas-admin.volume'
  'rubynas-admin.shared_folder'
  'partials'
])

RubynasAdmin.config([
  '$routeProvider'
  '$locationProvider'
  '$httpProvider'

($routeProvider, $locationProvider, $httpProvider, config) ->
  # Show backend http errors
  $httpProvider.responseInterceptors.push('httpErrorInterceptor')

  $routeProvider
    .when "/system/summary",
      controller: SystemSummaryController
      templateUrl: "/partials/system.summary.html"
    .when "/shared_folders",
      controller: SharedFolderListController
      templateUrl: "/partials/shared_folders.index.html"
    .when "/shared_folders/:id",
      controller: SharedFolderController
      templateUrl: "/partials/shared_folders.form.html"
    .when "/groups",
      controller: GroupListController,
      templateUrl: "/partials/groups.index.html"
    .when "/groups/:cn",
      controller: GroupController,
      templateUrl: "/partials/groups.form.html"
    .when "/users",
      controller: UserListController,
      templateUrl: "/partials/users.index.html"
    .when "/users/:cn",
      controller: UserController,
      templateUrl: "/partials/users.form.html"
    .when "/volumes",
      controller: VolumeListController
      templateUrl: "/partials/volumes.index.html"
    .when "/volumes/:id",
      controller: VolumeController
      templateUrl: "/partials/volumes.form.html"

    # Catch all
    .otherwise({redirectTo: '/system/summary'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(true)
])
