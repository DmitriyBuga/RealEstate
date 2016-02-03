app.controller("estatesTblController", function ($scope, angularService) {
    GetAllEstates();
    $scope.selectedUser = [];
    $scope.selectedCity = [];
    $scope.sortReverse = false;
    $scope.sortType = 'ID'
    //$scope.filtered = 0;//$scope.estates.length;
    $scope.listCity = [{
        id: 1,
        name: 'Apple'
    }, {
        id: 2,
        name: 'Facebook'
    }, {
        id: 3,
        name: 'Google'
    }];
    $scope.listUser = [{
        id: 1,
        name: 'Apple'
    }, {
        id: 2,
        name: 'Facebook'
    }, {
        id: 3,
        name: 'Google'
    }];
    $scope.setSelected = function (id, sList) {
        
        if (_.contains($scope[sList], id)) {
            $scope[sList] = _.without($scope[sList], id);
        } else {
            $scope[sList].push(id);
        }
        return false;
    }
    $scope.isChecked = function (id, sList) {
        if (_.contains($scope[sList], id)) {
            return 'glyphicon glyphicon-ok';
        }
        else {
            return'';
        }
    }
    $scope.checkAll = function (sList,sSelected) {
        $scope[sSelected] = _.pluck($scope[sList], 'id');
    };
    function GetAllEstates() {
        var getData = angularService.GetAllEstates();
        getData.then(function (est) {
            $scope.estates = est.data;
            //$scope.filtered = $scope.estates.length;
        }, function () {
            //alert('Error in getting records');
        });
    }
    $scope.editEstate = function (estate) {
        var getData = angularService.editEstate(estate);
        $location.path("Estates/EditEstate");
        getData.then(function (estate) {
            $scope.estate = estate.data
        },
        function () {
            alert('Error in getting records');
        });
    }
    function GetEstatesByUser(id) {
        var getData = angularService.GetEstatesByUser(id);
        getData.then(function (est) {
            $scope.estates = est.data;
        }, function () { }
        );
    }
    $scope.userFilter = function (estates, selectedUser) {
        if (!angular.isUndefined(estates) && !angular.isUndefined(selectedUser) && selectedUser.length > 0) {
            var tempEstates = [];
            angular.forEach(selectedUser, function (id) {
                angular.forEach(estates, function (estate) {
                    if (angular.equals(estate.user.id, id)) {
                        tempClients.push(estate);
                    }
                });
            });
            return tempEstates;
        } else {
            return estates;
        }
    }
});
app.controller("estateEditController", function ($scope, angularService) {
    $scope.myInterval = 500;
    $scope.uploadFiles = [];
    $scope.attachment;
    $scope.slides = [];
    $scope.getSlides = function (estateId) {
        var getData = angularService.getSlides(estateId);
        getData.then(function (images) {
            $scope.slides = images.data;
            alert($scope.listImages[0]);
        });
    }
    $scope.getImageList = function (estateId) {
        var getData = angularService.getImageList(estateId);
        getData.then(function (images) {
            $scope.slides = images.data;
        });
    }
    $scope.listImages = function (estateId) {
        alert(estateId);

        return "";
    }
    $scope.uploadFile = function () {
        alert($scope.uploadFiles.length);
        for (var i = 0; i < $scope.uploadFiles.length; i++) {
            alert($scope.uploadFiles[i].name);
            var getData = angularService.uploadImage($scope.uploadFiles[i]);
            getData.then(function (images) { alert("dddd") }
            );
        }
    }
    $scope.onFileSelect = function ($files) {
        alert($files[0].name);
        alert($files.length);
        $scope.uploadFiles = $files;
    }
     
});
//