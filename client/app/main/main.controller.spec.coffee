'use strict'

describe 'Controller: MainCtrl', ->

  # load the controller's module
  beforeEach module 'qiitenaiApp' 

  MainCtrl = undefined
  scope = undefined
  $httpBackend = undefined

  # Initialize the controller and a mock scope
  beforeEach inject (_$httpBackend_, $controller, $rootScope) ->
    $httpBackend = _$httpBackend_
    $httpBackend.expectGET('/api/things').respond [
      'HTML5 Boilerplate'
      'AngularJS'
      'Karma'
      'Express'
    ]
    scope = $rootScope.$new()
    MainCtrl = $controller 'MainCtrl',
      $scope: scope

  it 'should attach a list of things to the scope', ->
    $httpBackend.flush()
    expect(scope.feeds.length).toBe 4
