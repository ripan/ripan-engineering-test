(function() {
    'use strict';

    angular.module('honeycomb.materials').directive('materialsList', function() {
        return {
            restrict: 'AE',
            templateUrl: '/assets/modules/materials/templates/index.html'
        };
    });

    angular.module('honeycomb.materials').directive('materialShow', function () {
        return {
            restrict: 'AE',
            templateUrl: '/assets/modules/materials/templates/show.html'
        };
    });

})();
