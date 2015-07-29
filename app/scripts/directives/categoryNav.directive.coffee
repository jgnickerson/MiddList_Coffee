angular.module('middlistApp').directive('categoryNav',['postsService',(postsService) ->
  return (
    scope: {}
    link: (scope) ->
      scope.categories = []
      postsService.getCategories().then((cats) -> scope.categories = cats)

    template:"""
      <div class="col-xs-8 col-xs-push-2 btn-group">
        <button type="button" class="btn btn-primary btn-lg">MiddList</button>
        <button id="main-dropdown-toggle" type="button" class="btn btn-primary btn-lg dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="glyphicon glyphicon-triangle-bottom"></span>
          <span class="sr-only">Toggle Dropdown</span>
        </button>
        <ul class="dropdown-menu">
          <li class="dropdown-header">
          <li><a ng-href="#/list">All Posts</a></li>
          <li ng-repeat="cat in categories"><a ng-href="#/list/{{cat.id}}">{{cat.name}}</a></li>
        </ul>
      </div>
    """
  )
])
