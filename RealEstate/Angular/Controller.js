﻿
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
function setItemByRoles(userRole, adminRole) {
    if(userRole == "true")
    {
        $('[id=authAdmin]').addClass('disabled');
        $('[id=authUser]').removeClass('disabled');
        $('[id=authUser]').filter('form input[type=submit]').removeAttr('disabled');
    }
    else
        if (adminRole == "true")
        {
            $('[id=authUser]').removeClass('disabled');
            $('[id=authAdmin]').removeClass('disabled');
            $('form input[type=submit]').removeAttr('disabled');
        }
    else//if (userRole == "false" && adminRole == "false")
    {
        $('[id=authAdmin]').addClass('disabled');
        $('[id=authUser]').addClass('disabled');
        //$('[id=authUser]').$('form input[type=submit]').attr('disabled', true);
        $('[id=authUser]').filter('form input[type=submit]').attr('disabled', true);
    }
}
function estatesBaseController($scope, $filter, angularService, viewModel) {
    $scope.selectedUser = [];
    $scope.selectedRegion = [];
    $scope.selectedCity = [];
    $scope.selectedFloor = [];
    $scope.selectedRoom = [];
    estatesBaseController.prototype.uncheckAll = function (sSelected) {
        //$scope.$$ChildScope.prototype[sSelected] = [];
        $scope[sSelected] = [];
    }
    estatesBaseController.prototype.isChecked = function (id, sList) {

        if (_.contains($scope[sList], id)) {
            return 'glyphicon glyphicon-ok';
        }
        else {
            return '';
        }
    }
    estatesBaseController.prototype.checkAll = function (sList, sSelected) {
        $scope[sSelected] = _.pluck($scope[sList], 'id');
    }
    estatesBaseController.prototype.setSelected = function (id, sList) {
        
        if (_.contains($scope[sList], id)) {
            $scope[sList] = _.without($scope[sList], id);
        } else {
            $scope[sList].push(id);
        }
        //$scope.search();
        return false;
    }
}
app.controller("estatesTblController", function ($scope, $filter, angularService, viewModel) {
    estatesBaseController.call(this, $scope, $filter, angularService, viewModel);
    $scope.prototype = Object.create(estatesBaseController.prototype);
    $scope.filterFields = [];
    $scope.pageSize = 10;
    $scope.currentPage = 0;
    
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
    $scope.setSelected = function (id, sList) {
        return $scope.prototype.setSelected(id, sList)
    }

    $scope.isChecked = function (id, sList) {
        return $scope.prototype.isChecked(id, sList)
    }
    $scope.uncheckAll = function (sSelected) {
        $scope.prototype.uncheckAll(sSelected)
        //$scope[sSelected] = [];
    }
    $scope.checkAll = function (sList, sSelected) {
        $scope.prototype.checkAll(sList, sSelected)
        //$scope[sSelected] = _.pluck($scope[sList], 'id');
    };
});
app.controller("dirDistrictsController", function ($scope, angularService, viewModel) {
    estatesBaseController.call(this, $scope, angularService, viewModel);
    $scope.prototype = Object.create(estatesBaseController.prototype);
    $scope.listCity = viewModel.listCity;
    $scope.districts = viewModel.districts;
    //$scope.selectedCity = [];
    $scope.record = { name: '' };
    $scope.delete = function (id) {
        angularService.dir_delete($scope.directory, id);
        var currentIndex = _.findIndex($scope.districts, { id: id });
        $scope.districts.splice(currentIndex, 1);
    }
    $scope.setSelected = function (id, sList) {
        return $scope.prototype.setSelected(id, sList)
    }

    $scope.isChecked = function (id, sList) {
        return $scope.prototype.isChecked(id, sList)
    }
    $scope.uncheckAll = function (sSelected) {
        $scope.prototype.uncheckAll(sSelected)
        //$scope[sSelected] = [];
    }
    $scope.checkAll = function (sList, sSelected) {
        $scope.prototype.checkAll(sList, sSelected)
        //$scope[sSelected] = _.pluck($scope[sList], 'id');
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
app.controller('ModalInstanceCtrl', function ($scope, $uibModalInstance, slide, slides) {
    
    $scope.item = 0;
    $scope.slide = slide;
    $scope.slides = slides
    $scope.item = _.indexOf($scope.slides, $scope.slide);
    
    /*
    $scope.selected = {
        item: $scope.items[0]
    };
    */
    $scope.next = function () {
        
        
        if ($scope.item < slides.length - 1)
        {
            $scope.item++;
            $scope.slide = slides[$scope.item];
        }
    }
    $scope.prev = function () {
        
       
        if ($scope.item > 0) {
            $scope.slide = slides[--$scope.item];
        }
    }
    $scope.ok = function () {
        $uibModalInstance.dismiss('cancel');
        //$uibModalInstance.close($scope.selected.item);
    };

    $scope.cancel = function () {
        $uibModalInstance.dismiss('cancel');
    };
});
app.controller("estateEditController", function ($scope, $uibModal, angularService) {
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
    $scope.deleteImage = function (slide) {
        var currentIndex = _.indexOf($scope.slides, slide);//$('div.active').index();
        
        if (currentIndex >= 0)
        {
            var image = slide;//$scope.slides[currentIndex]
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
    
    $scope.openPhoto = function (slide) {
        $uibModal.open({
            templateUrl: 'modalPhoto.html',
            controller: 'ModalInstanceCtrl',
            size: 'lg',
            resolve: {
                slide: function(){
                    return slide;
                },
                slides: function () {
                    return $scope.slides;
                }
            }
        });
    }
/*
        var modal = document.getElementById('myModal');

        // Get the image and insert it inside the modal - use its "alt" text as a caption
        var img = document.getElementById('myImg');
        var modalImg = document.getElementById("img01");
        var captionText = document.getElementById("caption");
        img.onclick = function () {
            modal.style.display = "block";
            modalImg.src = this.src;
            modalImg.alt = this.alt;
            captionText.innerHTML = this.alt;
        }

        // Get the <span> element that closes the modal
        var span = document.getElementsByClassName("close")[0];

        // When the user clicks on <span> (x), close the modal
        span.onclick = function () {
            modal.style.display = "none";
        }
    }*/
    $scope.file_changed = function (element) {
        
        $scope.$apply(function (scope) {
            var data = new FormData();
            
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