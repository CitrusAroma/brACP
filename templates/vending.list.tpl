{**
 *  brACP - brAthena Control Panel for Ragnarok Emulators
 *  Copyright (C) 2015  brAthena, CHLFZ
 *
 *  This program is free software: you can redistribute it and/or modify
 *  it under the terms of the GNU General Public License as published by
 *  the Free Software Foundation, either version 3 of the License, or
 *  (at your option) any later version.
 *
 *  This program is distributed in the hope that it will be useful,
 *  but WITHOUT ANY WARRANTY; without even the implied warranty of
 *  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *  GNU General Public License for more details.
 *
 *  You should have received a copy of the GNU General Public License
 *  along with this program.  If not, see <http://www.gnu.org/licenses/>.
 *}

{extends file="default.tpl"}
{block name="brACP_Body"}

<div ng-controller="vending.list" ng-init='init()' style='width: 100%;'>

    <h1>{translate}@VENDING_TITLE@{/translate}</h1>

    {if $smarty.const.BRACP_CACHE eq true}
        <div class="message warning">
            {translate}@WARNING_CACHE.ON@{/translate}
        </div>
    {/if}

    <p>{translate}@VENDING_MESSAGE@{/translate}</p>

    <div style="text-align: right;" ng-if="state == 0">
        <button class="button warning icon" ng-click="refreshList()">
            {translate}@VENDING_BUTTONS_REFRESH@{/translate}
        </button>
    </div>

    <div class="loading-ajax" ng-if="state != 0">
        <div class="loading-bar loading-bar-1"></div>
        <div class="loading-bar loading-bar-2"></div>
        <div class="loading-bar loading-bar-3"></div>
        <div class="loading-bar loading-bar-4"></div>
    </div>

    <div ng-if="state == 0 && list.merchants.length == 0" class="message info icon">
        {translate}@VENDING_NO.VENDING@{/translate}
    </div>

    {literal}
        <div ng-if="state == 0 && list.merchants.length > 0" style='width: 100%;'>
            <div>Mapa:
                <select ng-model="map" ng-change="mapChange()">
                    <option value="">- Todos os Mapas</option>
                    <option ng-repeat="map in list.map_keys" value="{{map}}">{{map}}</option>
                </select>
            </div>

            <div class="merchant-data">
                <div class="merchant-shop" ng-repeat="merchant in filter_list">
                    <div class="merchant-title" data-map="{{merchant.map}} ({{merchant.x}},{{merchant.y}})">{{merchant.title}}</div>
                    <div class="merchant-items-table">
                        <div class="merchant-items-row" ng-repeat="item in merchant.items">
                            <div class="merchant-items-cell" style="text-align: right;">{{item.amount}}x</div>
                            <div class="merchant-items-cell">
                                <div class="item-info" ng-attr-data-slot="{{item.item.slots > 0 ? item.item.slots : undefined}}" ng-attr-data-refine="{{item.refine > 0 ? item.refine : undefined}}" style="background-image: url({{item.item.icon}})">
                                    {{item.item.name}}
                                </div>
                            </div>
                            <div class="merchant-items-cell" style="text-align: right;">{{item.price}}z</div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    {/literal}

</div>

{/block}
