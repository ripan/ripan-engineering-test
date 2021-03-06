﻿(function() {
    'use strict';

    var apiUrl = '/materials/:id'

    angular.module('honeycomb.materials').factory("Material", ['$resource', function($resource) {
        return $resource(apiUrl, { id: '@id' }, {
            update: { method: 'PATCH' },
        });
    }]);

})();
