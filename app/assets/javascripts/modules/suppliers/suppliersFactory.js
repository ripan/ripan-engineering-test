(function() {
    'use strict';

    var apiUrl = '/suppliers/:id'

    angular.module('honeycomb.suppliers').factory("Supplier", ['$resource', function($resource) {
        return $resource(apiUrl, { id: '@id' }, {
            update: { method: 'PATCH' },
        });
    }]);

})();
