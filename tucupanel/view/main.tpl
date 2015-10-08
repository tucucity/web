
<div class="container-fluid tucucity-sinpadd tucucity-fondoBlanco">
    <div class="container">
        <div class="row">
            <section>
                <ul class="nav nav-pills">
                    <li ng-class="{ active:tab.isSet(1) }">
                        <a href ng-click="tab.setTab(1)">Descripción</a>
                    </li>
                    <li ng-class="{ active:tab.isSet(2) }">
                        <a href ng-click="tab.setTab(2)">Datos</a>
                    </li>
                </ul>

                <!--  Description Tab's Content  -->
                <div ng-show="tab.isSet(1)" ng-include="'view/product-description.html'">
                </div>

                <!--  Spec Tab's Content  -->
                <div product-specs ng-show="tab.isSet(2)"></div>

            </section>
        </div>
        <div class="row">
            <div ng-controller="ProductosController">
                <div>
                        {{Message}}
                </div>

            </div>
        </div>
        <div class="row">
            <div ng-controller="ProductosController">
                <div style="font-weight:bold">
                    Detalle
                </div>
                <table class="tableData" cellpadding="0" cellspacing="0" width="80%" border="0">
                    <tr>
                        <th>Id : </th>
                        <th>Nombre : </th>
                        <th>Stock : </th>
                        <th>Codbar : </th>
                    </tr>
                    <tr ng-repeat="p in productos" ng-class-odd="'odd'" ng-class-even="'even'">
                        <td>{{p.Id}}</td>
                        <td>{{p.nombre}}</td>
                        <td>{{p.stock}}</td>
                        <td>{{p.codbar}}</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
</div>
