(function() {
    'use strict';

    var apiUrl = '/materials'

    angular.module('MaterialsModule').factory("Material", ['$resource', function($resource) {
        return $resource(apiUrl, { id: '@id' }, {
            update: { method: 'PATCH' },
        });
    }]);

})();
