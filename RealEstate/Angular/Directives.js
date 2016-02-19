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
            
//<th sort-by='user_name'>
//<div class= "btn-group" cmb-filter
app.directive("cmbFilter", function ($compile) {
    return {

        restrict: "EA",
        replace: false,
        scope: {
            captionText:'@title',
            list: '=list',
            selectedVar: '=selectedVar',
            onCheckAll: '&',
            onUncheckAll: '&',
            onSelectItem: '&',
            setCheckIcon:'&'
        },
        //templateUrl:'/Angular/tpls/tplCmbFilter.html'//не закрывается дропдаунлист
        
        template:
            '<div class="btn-group" data-ng-class="{open:open}" ng-model="prefixModel">' +
                '<button class="btn">{{captionText}}</button>' +
                '<button class="btn dropdown-toggle" data-ng-click="open=!open">' +
                    '<span class="caret"></span>' +
                '</button>' +
                '<ul class="dropdown-menu" aria-labelledby="dropdownMenu">' +
                    '<li>' +
                        '<a ng-click="onCheckAll({list:list, selectedVar:selectedVar})"><i class="glyphicon glyphicon-check"></i>  Check All</a>' +
                    '</li>' +
                    '<li>' +
                        '<a data-ng-click="onUncheckAll({list:list})"><i class="glyphicon glyphicon-unchecked"></i>  Uncheck All</a>' +
                    '</li>' +
                    '<li class="divider"></li>' +
                    '<li data-ng-repeat="user in list">' +
                        '<a data-ng-click="onSelectItem({id:user.id, selectedVar:selectedVar})">{{user.name}}<span data-ng-class="setCheckIcon({id:user.id,selectedVar:selectedVar})"></span></a>' +
                    '</li>' +
                '</ul>' +
            '</div>'  
        ,
        terminal: true,
        link: function (scope, element, attrs) {
            $compile(element.contents())(scope.$new());
        }
    }
})