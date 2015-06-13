'use strict'

describe 'Controller: PostCtrl', ->

  # load the controller's module
  beforeEach module 'qiitenaiApp'
  PostCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    PostCtrl = $controller 'PostCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
