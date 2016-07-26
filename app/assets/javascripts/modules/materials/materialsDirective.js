(function() {
    'use strict';

    angular.module('honeycomb.materials').directive('materialsList', function() {
        return {
            restrict: 'AE',
            templateUrl: 'materials/index.html'
        };
    });

    angular.module('honeycomb.materials').directive('materialShow', function () {
        return {
            restrict: 'AE',
            templateUrl: 'materials/show.html'
        };
    });

})();
