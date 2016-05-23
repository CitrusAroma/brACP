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
<!DOCTYPE html>
<html>
    <head>
        <title>brACP - {block name="brACP_Title"}Welcome{/block} {if $smarty.const.BRACP_DEVELOP_MODE eq true}(DEVELOPER MODE){/if}</title>

        <!--
            2016-04-14, CHLFZ: Problemas de CHARSET identificado por pelo Sir Will e postado no fórum.
                                -> @issue 7
        -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1, maximum-scale=1.0">

        <link rel="shortcut icon" href="{$smarty.const.BRACP_DIR_INSTALL_URL}fav.ico">
        <!-- Here loads all CSS files. -->
        <link rel="stylesheet" type="text/css" href="{$smarty.const.BRACP_DIR_INSTALL_URL}themes/classic/css/default.css"/>
        <link rel="stylesheet" type="text/css" href="{$smarty.const.BRACP_DIR_INSTALL_URL}themes/classic/css/message.css"/>
        <link rel="stylesheet" type="text/css" href="{$smarty.const.BRACP_DIR_INSTALL_URL}themes/classic/css/button.css"/>
        <link rel="stylesheet" type="text/css" href="{$smarty.const.BRACP_DIR_INSTALL_URL}themes/classic/css/modal.css"/>
        <style>
        {block name="brACP_StyleCss"}
        {/block}
        </style>

        <!-- Here loads all JAVASCRIPTS files -->
        {if $smarty.const.BRACP_DEVELOP_MODE eq true}
            <script src="{$smarty.const.BRACP_DIR_INSTALL_URL}js/jquery-2.1.4.js"></script>
            <script src="{$smarty.const.BRACP_DIR_INSTALL_URL}js/angular.js"></script>
        {else}
            <script src="{$smarty.const.BRACP_DIR_INSTALL_URL}js/jquery-2.1.4.min.js"></script>
            <script src="{$smarty.const.BRACP_DIR_INSTALL_URL}js/angular.min.js"></script>
        {/if}

        {if $smarty.const.BRACP_RECAPTCHA_ENABLED eq true}
            <script src="https://www.google.com/recaptcha/api.js"></script>
        {else}
            <script>var grecaptcha = false;</script>
        {/if}

        <script>
        {if $smarty.const.BRACP_DEVELOP_MODE eq true}
            console.info("---------------------------------------\n" +
                            "brACP - Developer Mode ON!!!!\n" +
                            "---------------------------------------\n" +
                            "BRACP_TEMPLATE_DIR: {$smarty.const.BRACP_TEMPLATE_DIR} \n" + 
                            "BRACP_DEFAULT_TIMEZONE: {$smarty.const.BRACP_DEFAULT_TIMEZONE} \n");
        {/if}

        {block name="brACP_JavaScript"}
        {/block}
        </script>
    </head>
    <body>
    {block name="brACP_HtmlBody"}
        <div class="content">
            <div class="header">
                <div class="menu-top access">

                    {if isset($account) eq false}
                        <button class="button small link">@@MENU,MYACC,UNAUTHENTICATED(LOGIN)</button>
                        {if $smarty.const.BRACP_ALLOW_CREATE_ACCOUNT eq true}
                            <button class="button small success">@@MENU,MYACC,UNAUTHENTICATED(CREATE)</button>
                        {/if}
                    {else}
                        <button class="button small error">@@MENU,MYACC,AUTHENTICATED(LOGOUT, {$userid})</button>
                    {/if}

                </div>

                <div class="menu-top link">
                    <ul>
                        <li>@@MENU(HOME)</li>
                        <li>@@MENU,MYACC(TITLE)
                            <ul>
                                {if isset($account) eq false}
                                    <li>@@MENU,MYACC,UNAUTHENTICATED(LOGIN)</li>
                                    {if $smarty.const.BRACP_ALLOW_CREATE_ACCOUNT eq true}
                                        <li>@@MENU,MYACC,UNAUTHENTICATED(CREATE)</li>
                                    {/if}
                                    {if $smarty.const.BRACP_ALLOW_MAIL_SEND}
                                        {if $smarty.const.BRACP_CONFIRM_ACCOUNT}
                                            <li>@@MENU,MYACC,UNAUTHENTICATED(CREATE_SEND)</li>
                                        {/if}
                                        {if $smarty.const.BRACP_ALLOW_RECOVER}
                                            <li>@@MENU,MYACC,UNAUTHENTICATED(RECOVER)</li>
                                        {/if}
                                    {/if}
                                {else}
                                {/if}
                            </ul>
                        </li>
                        {if $smarty.const.BRACP_ALLOW_RANKING}
                            <li>@@MENU,RANKINGS(TITLE)
                                <ul>
                                    <li>@@MENU,RANKINGS(CHARS)</li>
                                    <li>@@MENU,RANKINGS(GUILDS)</li>
                                    <li>@@MENU,RANKINGS(CASTLES)</li>
                                    {if $smarty.const.BRACP_ALLOW_RANKING_ZENY}
                                        <li>@@MENU,RANKINGS(ECONOMY)</li>
                                    {/if}
                                </ul>
                            </li>
                        {/if}
                    </ul>
                </div>

                <div class="menu-top logo">
                </div>
            </div>

            <div class="body">
                {block name="brACP_Body"}
                    Layout em construção.
                {/block}
            </div>

        </div>
    {/block}
        <input type="hidden" id="_BRACP_URL" value="{$smarty.const.BRACP_DIR_INSTALL_URL}"/>
    </body>
</html>