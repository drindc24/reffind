var reffind = angular.module('reffind',['ngResource']);

reffind.controller('SearchCtrl', ['$scope', '$resource', function($scope, $resource) {
    var Flickr = $resource('/search?search_text=:search_text', {search_text: '@search_text'});
    $scope.results = [];
    $scope.searchText = '';
    $scope.submit = function() {
        if ($scope.searchText) {
            Flickr.query({search_text: $scope.searchText}, function(array){
                    for (i=0; i< array.length; i++){
                        $scope.results.push({url: "www.flickr.com/photos/" + array[i].attributes.owner + "/" + array[i].attributes.id, title: array[i].attributes.title})
                    }
                }
            );
        }
    };


}]);