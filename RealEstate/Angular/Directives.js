app.directive("sortBy", function($compile){
    return {
        require: "?ngModel",
        restrict: "A",
        replace: false,
        template: function(tElement, tAttrs)
        {
            return "<strong class='solo-table-column-cursor' ng-click='orderTableBy(\""+ tAttrs.sortBy +"\")'>" + tElement.html()+ "</strong>";

        },
        link: function (scope, elm, attrs, ngm)
        {
            if (attrs.sortBy)
            {
                elm.append("<span class='solo-column-arrow'></span>");
                scope.tableHeaders[attrs.sortBy] = elm;
            }
        }
    };
})