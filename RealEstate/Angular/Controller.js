app.controller("estatesTblController", function ($scope,$filter, angularService) {
    
    $scope.pageSize = 10;
    $scope.currentPage = 0;
    $scope.selectedUser = [];
    $scope.selectedCity = [];
    $scope.filtered = [];
    $scope.estates = [];
    $scope.itemsOnPage = 10;
    GetAllEstates();
    $scope.sortReverse = false;
    $scope.sortType = 'ID'
    $scope.tableHeaders = {};
    $scope.sortMode = 2;
    $scope.order = {
        header: null,
        direction: false
    };
    $scope.setSortMode = function (mode) {
        if (mode == "" || mode == null)
            $scope.sortMode = 2;
        else
            $scope.sortMode = parseInt(mode);
    };
    $scope.orderTableBy = function (header) {

        if ($scope.sortMode == 2) {
            // это для работы в 2-х режимах ASC и DESC
            if ($scope.order.header == header && $scope.order.direction == false) {
                $scope.order.direction = true;
            }
            else {
                $scope.order.header = header;
                $scope.order.direction = false;
            }
        }
        if ($scope.sortMode == 3) {
            if ($scope.order.header == header && $scope.order.direction == true) {
                $scope.order.header = null; // очистка сортировки.
            }
            else if ($scope.order.header == header) {
                $scope.order.direction = true;
            }
            else {
                $scope.order.header = header;
                $scope.order.direction = false;
            }
        }

    };
    $scope.pager = {
        onPage: 10, // сколько записей на странице
        currentPage: 1, // номер текущей страницы
        found: 0, // найдено записей
        foundPages: 0, // количество страниц в таблице

        /**
         * Устанавливает количество записей на странице
         * @param num int Количество записей на странице
         */
        setOnPage: function (num) {
            alert(num);
            this.onPage = parseInt(num);
            this.update($scope.filtered.length);
        },

        /**
         * Возвращает количество записей на странице
         * @returns int
         */
        getOnPage: function () {
            return this.onPage;
        },

        /**
         * Обновляет данные пейджера
         * @param len int Количество записей в таблице (после применения фильтра)
         */
        update: function (len) {
            this.found = len;
            this.foundPages = Math.ceil(len / this.onPage);
            this.currentPage = 1;
        }
    };
    /**
     * Переход на следующую страницу
     */
    $scope.gotoNextPage = function () {
        if ($scope.pager.foundPages == $scope.pager.currentPage)
            return true;
        $scope.pager.currentPage++;
    };

    /**
     * Переход на первую страницу
     */
    $scope.gotoFirstPage = function () {
        $scope.pager.currentPage = 1;
    };

    /**
     * Переход на последнюю страницу
     */
    $scope.gotoLastPage = function () {
        $scope.pager.currentPage = $scope.pager.foundPages;
    };

    /**
     * Переход на предыдущую страницу
     */
    $scope.gotoPrevPage = function () {
        if ($scope.pager.currentPage == 1)
            return true;
        $scope.pager.currentPage--;
    };

    // следим за коллекцией отфильтрованных элементов
    $scope.$watchCollection("filtered", function (list) {
        $scope.pager.update(list.length);
    });
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
    $scope.search = function () {
        var tempEstates = [];
        if (!angular.isUndefined($scope.estates) && !angular.isUndefined($scope.selectedUser) && $scope.selectedUser.length > 0) {
            angular.forEach($scope.selectedUser, function (id) {
                angular.forEach($scope.estates, function (estate) {
                    if (angular.equals(estate.user_id, id)) {
                        tempEstates.push(estate);
                    }
                });
            });
            $scope.itemsByPage = $scope.paged(tempEstates);
        }
        else {
            $scope.itemsByPage = $scope.paged($scope.estates);
        }
        $scope.currentPage = 0;
        //alert($scope.itemsByPage.length);
    };
    $scope.paged = function (valLists) {
        var pageSize = $scope.pageSize;
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
        
        $scope.itemsByPage = $scope.paged($scope.estates)
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
        $scope.search();
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
    $scope.setDirectory = function (dir) {
        $scope.directory = dir;
    }
    $scope.setValue = function (index) {
        $scope.regions[index] = 'asassdsd';
    }
    $scope.directory = '';
    $scope.record = { name: '' };
    $scope.delete = function (id) {
        angularService.dir_delete("Regions",id);
        var currentIndex = _.findIndex($scope.regions, { id: id });
        $scope.regions.splice(currentIndex, 1);
    }
    $scope.update = function (id, name, index) {
        if (id == -1) {
            var getData = angularService.dir_createRecord('Regions', { id: id, name: name });
            getData.then(function (regions) {
                $scope.regions[index] = regions.data;
            });
        }
        else {
            var getData = angularService.dir_updateRecord('Regions', { id: id, name: name });
        }
    }
    $scope.add = function () {
        var region = {id:-1, name:''}
        $scope.regions.push(region);
    }
    $scope._add = function (directory, name) {
        $scope.record.name = name;
        angularService.dir_createRecord(directory, $scope.record);
    }
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