'use strict'

# Declare app level module which depends on filters, and services
RubynasAdmin = angular.module('rubynas-admin', [
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
  'partials'
])

RubynasAdmin.config([
  '$routeProvider'
  '$locationProvider'

($routeProvider, $locationProvider, config) ->

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
    .when('/todo', {templateUrl: '/partials/todo.html'})
    .when('/view1', {templateUrl: '/partials/partial1.html'})
    .when('/view2', {templateUrl: '/partials/partial2.html'})

    # Catch all
    .otherwise({redirectTo: '/todo'})

  # Without server side support html5 must be disabled.
  $locationProvider.html5Mode(false)
])
