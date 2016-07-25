(function() {
    'use strict';

    angular.module('MaterialsModule').directive('materialsList', function() {
        return {
            restrict: 'AE',
            templateUrl: '/assets/modules/materials/templates/list.html'
        };
    });

})();
