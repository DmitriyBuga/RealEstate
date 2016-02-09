app.controller("estatesTblController", function ($scope, angularService) {
    
    $scope.pageSize = 3;
    $scope.currentPage = 0;
    $scope.selectedUser = [];
    $scope.selectedCity = [];
    GetAllEstates();
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
    $scope.paged = function (valLists, pageSize) {
        
        retVal = [];
        for (var i = 0; i < valLists.length; i++){
            if (i % pageSize === 0) {
                retVal[Math.floor(i / pageSize)] = [valLists[i]];
            } else {
                retVal[Math.floor(i / pageSize)].push(valLists[i]);
            }
        }
        return retVal;
    }
    $scope.pagination = function () {
        
        $scope.itemsByPage = $scope.paged($scope.estates, $scope.pageSize)
        alert($scope.itemsByPage[0]);
    }
    $scope.setPage = function () {
        $scope.currentPage = this.n;
    }
    $scope.firstPage = function () {
        $scope.currentPage = 0;
    };
    $scope.range = function (input, total) {
        var ret = [];
        if (!total) {
            total = input;
            input = 0;
        }
        for (var i = input; i < total; i++) {
            if (i != 0 && i != total - 1) {
                ret.push(i);
            }
        }
        return ret;
    };

    $scope.lastPage = function () {
        $scope.currentPage = $scope.itemsByPage.length - 1;
    };
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
            
            $scope.pagination();
            //$scope.filtered = $scope.estates.length;
        }, function () {
            //alert('Error in getting records');
        });
    }
    $scope.deleteEstate = function (estateId) {
        var getData = angularService.deleteEstate(estateId);
        var currentIndex = _.findIndex($scope.estates, { id: estateId });
        $scope.estates.splice(currentIndex, 1);
        $scope.pagination();
        //$scope.GetAllEstates();
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
app.controller("dirController", function ($scope, angularService) {
    $scope.setRegions = function () {
        var getData = angularService.getRegions();
        getData.then(function (regions) {
            $scope.regions = regions.data;
        });
    }
    $scope.setCities = function () {
        var getData = angularService.getCities(regionId);
        getData.then(function (cities) {
            $scope.cities = cities.data;
        });
    }
    $scope.setDistricts = function () {
        var getData = angularService.getDistricts(cityId);
        getData.then(function (districts) {
            $scope.districts = districts.data;
        });
    }
    $scope.setStreets = function () {
        var getData = angularService.getStreets(cityId);
        getData.then(function (streets) {
            $scope.streets = streets.data;
        });
    }
        

});
app.controller("estateEditController", function ($scope, angularService) {
    $scope.myInterval = 500;
    $scope.uploadFiles = [];
    $scope.attachment;
    $scope.slides = [];
    $scope.estateId = 0
    $scope.setCurrentEstateId = function (estateId) {
        $scope.estateId = estateId;
    }
    $scope.getSlides = function () {
        var getData = angularService.getSlides($scope.estateId);
        getData.then(function (images) {
            $scope.slides = images.data;
        });
    }
    $scope.deleteImage = function () {
        var currentIndex = $('div.active').index();
        //debugger
        if (currentIndex >= 0)
        {
            var image = $scope.slides[currentIndex]
            var estateId = $scope.estateId;
            angularService.deleteImage(image, estateId);
            $scope.slides.splice(currentIndex, 1);
            $scope.slides[0].active = true;
            //$scope.getImageList($scope.estateId);
        }
        return "";
    }
    $scope.getImageList = function () {
        var getData = angularService.getImageList($scope.estateId);
        getData.then(function (images) {
            $scope.slides = images.data;
        });
    }
    $scope.listImages = function (estateId) {
        return "";
    }
    
    $scope.file_changed = function (element) {

        $scope.$apply(function (scope) {
            var data = new FormData();
            //debugger
            for (var i in element.files) {
                data.append("uploadedFile", element.files[i]);
            }
            data.append("estateId", JSON.stringify($scope.estateId))
            

            // ADD LISTENERS.
            var objXhr = new XMLHttpRequest();
            //objXhr.addEventListener("progress", updateProgress, false);
            objXhr.addEventListener("load", transferComplete, false);

            // SEND FILE DETAILS TO THE API.
            
            objXhr.open("POST", "/Estates/FileUpload/");
            //objXhr.setRequestHeader("id", estateId);
            //objXhr.setRequestHeader("Content-Type", element.type);
            objXhr.send(data);
/*
            var photofile = element.files[0];
            
            var reader = new FileReader();
            reader.onload = function (e) {
                
                // handle onload
            };
            reader.readAsDataURL(photofile);
            alert(reader)
            */
            
        });
        //$scope.slides.pop(element.files[0])
        
    };
    

    // CONFIRMATION.
    function transferComplete(e) {
        //alert("Files uploaded successfully.");
        //alert($scope.estateId);
        $scope.getImageList($scope.estateId);
    }
     
});
//