app.service("angularService", function ($http) {
    this.dir_createDistrict = function (record) {
        var responce = $http({
            method: "POST",
            url: "/Directories/CreateDistrict",
            params: {id:-1, name: record.name, city_id: record.city_id },
            dataType:JSON
        });
    }
    this.dir_updateDistrict = function (record) {

        var responce = $http({
            method: "POST",
            url: "/Directories/UpdateDistrict",
            params: { id: record.id, name: record.name, city_id: record.city_id },
        });
        return responce;
    }
    this.dir_createRecord = function (directory, record) {
        var responce = $http({
            method: "POST",
            url: "/Directories/Create" + directory,
            params: { name: record.name },
            dataType:"JSON"
        });
        return responce;
    }
    this.dir_delete = function (directory, id) {
        var responce = $http({
            method: "POST",
            url: "/Directories/Delete" + directory,
            params: { id: JSON.stringify(id)},
        });
        return responce;
    }
    this.dir_updateRecord = function (directory, record) {
        
        var responce = $http({
            method: "POST",
            url: "/Directories/Update" + directory,
            params: { id: record.id, name: record.name },
        });
        return responce;
    }
    
    this.getRegions = function (directory) {
        
        return $http.get("/Directories/Get" + directory)
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