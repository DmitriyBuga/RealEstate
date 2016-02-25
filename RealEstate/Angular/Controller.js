
function HightlightMemu(path, cur_url) {
    //навешиваем события по наведению мыши  
    jQuery(path).each(function () {
        jQuery(this).mouseover(function () { jQuery(this).parent('li').addClass('active'); });
        jQuery(this).mouseout(function () { jQuery(this).parent('li').removeClass('active'); })
    });
    //Ищем подходящий пункт меню для выделения  
    var url = "";
    if (cur_url == "")
        url = window.location.toString();
    else
        url = cur_url;

    var max = 0;
    var link = null;

    jQuery(path).each(function () {
        //finding the longest href  
        if (url.indexOf(this.href) >= 0 && this.href.length > max) {
            link = this;
            max = this.href.length;
        }
    });

    if (link)
        jQuery(link).parent('li').addClass('current');
}

function initMenu() {
    //left navigation current item highlight  
    HightlightMemu("#top_menu > li > a", "");
};

jQuery(document).ready(function () {
    initMenu();
});

app.controller("estatesTblController", function ($scope, $filter, angularService, viewModel) {
    
    $scope.pageSize = 10;
    $scope.currentPage = 0;
    $scope.selectedUser = [];
    $scope.selectedRegion = [];
    $scope.selectedCity = [];
    $scope.selectedFloor = [];
    $scope.selectedRoom = [];
    $scope.filtered = [];
    $scope.estates = [];
    $scope.itemsOnPage = 10;
    
    
    $scope.sortReverse = false;
    $scope.sortType = 'ID'
    $scope.tableHeaders = {};
    $scope.sortMode = 2;
    
    $scope.estates = viewModel.estates;
    $scope.listCity = viewModel.cities;
    $scope.listUser = viewModel.users;
    $scope.listRoom = viewModel.rooms;
    $scope.listFloor = viewModel.floors
    $scope.listRegion = viewModel.regions;
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

        setOnPage: function (num) {
            this.onPage = parseInt(num);
            this.update($scope.filtered.length);
        },

        getOnPage: function () {
            return this.onPage;
        },

        update: function (len) {
            this.found = len;
            this.foundPages = Math.ceil(len / this.onPage);
            this.currentPage = 1;
        }
    };
   
    $scope.gotoNextPage = function () {
        if ($scope.pager.foundPages == $scope.pager.currentPage)
            return true;
        $scope.pager.currentPage++;
    };

    
    $scope.gotoFirstPage = function () {
        $scope.pager.currentPage = 1;
    };

    $scope.gotoLastPage = function () {
        $scope.pager.currentPage = $scope.pager.foundPages;
    };

    
    $scope.gotoPrevPage = function () {
        if ($scope.pager.currentPage == 1)
            return true;
        $scope.pager.currentPage--;
    };

    $scope.$watchCollection("filtered", function (list) {
        $scope.pager.update(list.length);
    });
    
    
    
    $scope.setSelected = function (id, sList) {
        if (_.contains($scope[sList], id)) {
            $scope[sList] = _.without($scope[sList], id);
        } else {
            $scope[sList].push(id);
        }
        //$scope.search();
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
    $scope.uncheckAll = function (sSelected) {
        $scope[sSelected] = [];
    }
    $scope.checkAll = function (sList, sSelected) {
        $scope[sSelected] = _.pluck($scope[sList], 'id');
    };
    
    $scope.deleteEstate = function (estateId) {
        var getData = angularService.deleteEstate(estateId);
        var currentIndex = _.findIndex($scope.estates, { id: estateId });
        $scope.estates.splice(currentIndex, 1);
    }
    function GetEstatesByUser(id) {
        var getData = angularService.GetEstatesByUser(id);
        getData.then(function (est) {
            $scope.estates = est.data;
        }, function () { }
        );
    }
});
app.controller("dirDistrictsController", function ($scope, angularService, viewModel) {
    $scope.listCity = viewModel.listCity;
    $scope.districts = viewModel.districts;
    $scope.selectedCity = [];
    $scope.record = { name: '' };
    $scope.delete = function (id) {
        angularService.dir_delete($scope.directory, id);
        var currentIndex = _.findIndex($scope.districts, { id: id });
        $scope.districts.splice(currentIndex, 1);
    }
    $scope.setSelected = function (id, sList) {
        if (_.contains($scope[sList], id)) {
            $scope[sList] = _.without($scope[sList], id);
        } else {
            $scope[sList].push(id);
        }
        //$scope.search();
        return false;
    }

    $scope.isChecked = function (id, sList) {
        if (_.contains($scope[sList], id)) {
            return 'glyphicon glyphicon-ok';
        }
        else {
            return '';
        }
    }
    $scope.uncheckAll = function (sSelected) {
        $scope[sSelected] = [];
    }
    $scope.checkAll = function (sList, sSelected) {
        $scope[sSelected] = _.pluck($scope[sList], 'id');
    };
    $scope.update = function (id, name, city_id, index) {
        if (id == -1) {
            var getData = angularService.dir_createDistrict({ id: id, name: name, city_id: city_id });
            getData.then(function (districts) {
                $scope.districts[index] = districts.data;
            });
        }
        else {
            var getData = angularService.dir_updateDistrict( { id: id, name: name, city_id: city_id });
        }
    }
    $scope.add = function () {
        var district = { id: -1, name: '', city_id: 0 }
        $scope.districts.push(district);
    }
});
app.controller("dirController", function ($scope, angularService, viewModel) {
    
    $scope.directory = viewModel.tableName;
    $scope.record = { name: '' };
    $scope.delete = function (id) {
        angularService.dir_delete($scope.directory, id);
        var currentIndex = _.findIndex($scope.regions, { id: id });
        $scope.regions.splice(currentIndex, 1);
    }
    $scope.update = function (id, name, index) {
        if (id == -1) {
            var getData = angularService.dir_createRecord($scope.directory, { id: id, name: name });
            getData.then(function (regions) {
                $scope.regions[index] = regions.data;
            });
        }
        else {
            var getData = angularService.dir_updateRecord($scope.directory, { id: id, name: name });
        }
    }
    $scope.add = function () {
        var region = {id:-1, name:''}
        $scope.regions.push(region);
    }
    $scope.setRegions = function (tableName) {
        var getData = angularService.getRegions($scope.directory);
        getData.then(function (regions) {
            
            $scope.regions = regions.data;
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