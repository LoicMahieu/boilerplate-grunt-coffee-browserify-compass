
angular = require 'angular'
require 'angular-ui-router'

app = angular.module 'app', [
  'ui.router'
]

app.config([
  '$stateProvider', '$urlRouterProvider',
  ($stateProvider, $urlRouterProvider) ->
    $urlRouterProvider
      .when('/c?id', '/contacts/:id')
      .when('/user/:id', '/contacts/:id')
      .otherwise('/')

    $stateProvider
      .state('home',
        url: '/'
        template: 'Hello home'
      )
      .state('about',
        url: '/about'
        templateProvider: ['$timeout', ($timeout) ->
          $timeout ->
            'Hello timeout!'
          , 100
        ]
      )
])
