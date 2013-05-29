window.SharedFolderListController = ($scope, $location, SharedFolder) ->
  $scope.sharedFolders = SharedFolder.query()

  $scope.edit = (id) ->
    $location.path("/shared_folders/" + id)
    
  $scope.addNew = () ->
    $location.path("/shared_folders/new")
  