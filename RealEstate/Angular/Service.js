app.service("angularService", function ($http) {
    this.GetAllEstates = function () {
        return $http.get("/Estates/GetAllEstates");
    };    
    this.editEstate = function (estate) {
        alert(estate.ID);
        var responce = $http({
            method: "post",
            url: "Estates/EditEstate",
            params: { iD: JSON.stringify(estate.ID) },
            dataType: "json"
        });
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
            urs: "/Estates/GetSlides",
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