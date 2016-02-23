app.service("angularService", function ($http) {
    this.dir_createRecord = function (directory, record) {
        var responce = $http({
            method: "POST",
            url: "/Directories/CreateRegion",
            params: { name: record.name },
            dataType:"JSON"
        });
        return responce;
    }
    this.dir_delete = function (directory, id) {
        var responce = $http({
            method: "POST",
            url: "/Directories/DeleteRegion",
            params: { id: JSON.stringify(id)},
        });
        return responce;
    }
    this.dir_updateRecord = function (directory, record) {
        var responce = $http({
            method: "POST",
            url: "/Directories/UpdateRegion",
            params: { id: record.id, name: record.name },
        });
        return responce;
    }
    
    this.getRegions = function () {
        return $http.get("/Directories/GetRegions")
    }
    this.getUsers = function () {
        return $http.get("/Directories/GetUsers")
    }
    this.getCities = function () {
        return $http.get("/Directories/GetCities")
    }
    /*
    this.getCities = function (regionId) {
        var responce = $http({
            method: "POST",
            url: "/Directories/GetCities",
            params: { regionId: JSON.stringify(regionId) },
            dataType:"JSON"
        });
        return responce;
    }
    */
    this.getStreets = function (cityId) {
        var responce = $http({
            method: "POST",
            url: "/Directories/GetStreets",
            params: { regionId: JSON.stringify(cityId) },
            dataType: "JSON"
        });
        return responce;
    }
    this.deleteEstate = function (estateId) {
        var responce = $http({
            method: "GET",
            url: "/Estates/DeleteEstate",
            params: { id: JSON.stringify(estateId) },
            dataType: "json"
        });
    }
    this.deleteImage = function (image, estateId) {
        var responce = $http({
            method: "GET",
            url: "/Estates/DeleteImage",
            params: {
                image: image,
                Id: JSON.stringify(estateId)
            }
        })
    }
    this.getImageList = function (estateId) {
        var responce = $http({
            method: "post",
            url: "/Estates/GetImageList",
            params: {
                Id: JSON.stringify(estateId)
            }
        });
        return responce;
    }
    this.getSlides = function (estateId) {
        var responce = $http({
            method: "post",
            url: "/Estates/GetSlides",
            params: {
                Id: JSON.stringify(estateId)
            }
        });
        return responce;
    }
    this.uploadImage = function (uploadFile) {
        var responce = $http({
            method: "post",
            url: "/Estates/_UploadImage",
            params: {
                uploadFiles: uploadFile
            }
        });
        return responce;
    }
});