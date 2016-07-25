(function() {
    'use strict';

    angular.module('MaterialsModule').controller('MaterialsCtrl', ['$scope', 'Material', function($scope, Material) {
        $scope.materials = Material.query();
    }]);

})();
