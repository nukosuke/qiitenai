'use strict'

angular.module 'qiitenaiApp'
.controller 'PostTabCtrl', ($scope, $location) ->

  $scope.isActive = (route) ->
    route is $location.path()