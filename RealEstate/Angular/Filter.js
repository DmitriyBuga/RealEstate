app.filter("pager", function () {
    return function (items, page, onPage) {
        if (items.length <= onPage)
            return items;
        
        var offset = (page - 1) * onPage;
        return items.slice(offset, offset + onPage);
    };
})
app.filter('customFilter', function () {
    return function (estates, selected, id_name) {        
        if (!angular.isUndefined(estates) && !angular.isUndefined(selected) && selected.length > 0) {
            var tempEstates = [];
            angular.forEach(selected, function (id) {
                angular.forEach(estates, function (estate) {
                    if (angular.equals(estate[id_name], id)) {
                        tempEstates.push(estate);
                    }
                });
            });
            return tempEstates;
        } else {
            return estates;
        }
        
    };
})
app.filter("filterByFields", function () {

    /**
     * @param items - Список фильтруемых записей
     * @param search - Искомая подстрока
     * @param items - список имен полей, по которым идет поиск
     */
    return function (items, search, fields) {

        if (!search)
            return items;
        if (fields.length == 0)
            throw Error("You have to define list of fields");
        search = ('' + search).toLowerCase();

        var test = function (el, idx, array) {
            var compare = function (val, search) {
                // null hasn't method toString()
                if (val == null)
                    return false;
                return val.toString().toLowerCase().indexOf(search) !== -1;
            };

            var result = false;
            var len = fields.length;
            for (var i = 0; i < len; i++) {
                if (compare(el[fields[i]], search)) {
                    result = true;
                    break;
                }
            }
            return result;
        };

        return items.filter(test);
    };
})