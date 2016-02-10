var app = angular.module("appRealEstate", [])/*.filter('setFilter', [function () {
    
    return function (estates, selectedUser, selectedCity) {
        if (!angular.isUndefined(estates) && !angular.isUndefined(selectedUser) && selectedUser.length > 0) {
            var tempEstates = [];
            angular.forEach(selectedUser, function (id) {
                angular.forEach(estates, function (estate) {
                    if (angular.equals(estate.USER_ID, id)) {
                        tempEstates.push(estate);
                    }
                });
            });
            //filtered = tempEstates.length;
            //alert(filtered);
            return tempEstates;
        } else {
            //if (estates != null)
              //  filtered = estates.length;
            return estates;
        }
    };
}]);*/