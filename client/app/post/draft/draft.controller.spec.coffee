'use strict'

describe 'Controller: DraftCtrl', ->

  # load the controller's module
  beforeEach module 'qiitenaiApp'
  DraftCtrl = undefined
  scope = undefined

  # Initialize the controller and a mock scope
  beforeEach inject ($controller, $rootScope) ->
    scope = $rootScope.$new()
    DraftCtrl = $controller 'DraftCtrl',
      $scope: scope

  it 'should ...', ->
    expect(1).toEqual 1
