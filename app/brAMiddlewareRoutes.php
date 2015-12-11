<?php
/**
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
 */

use Model\Login;

class brAMiddlewareRoutes extends Slim\Middleware
{
    public function call()
    {
        $app = brACPSlim::getInstance();

        /*********************
        **********************
        **** GET - ROUTES ****
        **********************
        **********************/
        // Defines the route to '/' directory
        $app->get('/', function() {
            brACPSlim::getInstance()->display('home');
        });

        $app->get('/account/register', function() {
            brACPSlim::getInstance()->display('account.register', [], 0);
        });

        $app->get('/account/login', function() {
            brACPSlim::getInstance()->display('account.login', [], 0);
        });

        $app->get('/account/recover', function() {
            brACPSlim::getInstance()->display('account.recover', [], 0);
        });

        // Define o loggout do usuário.
        $app->get('/account/loggout', function() {
            brACPSlim::getInstance()->display('account.loggout', [], 1, function() {
                brACPSlim::getInstance()->accountLoggout();
            });
        });

        /*********************
        **********************
        **** POST - ROUTES ***
        **********************
        **********************/
        $app->post('/account/login', function() {

            brACPSlim::getInstance()->display('account.login', [], 0, null, function() {

                // Tenta realizar o login via post.
                if(brACPSlim::getInstance()->accountLogin())
                    return ['message' => ['success' => 'Usuário logado com sucesso. Aguarde...']];

                // Por default retorna o erro.
                return ['message' => ['error' => 'Combinação de usuário e senha inválidos!']];
            });

        });

        // Rota para registrar a conta do usuário.
        $app->post('/account/register', function() {

            brACPSlim::getInstance()->display('account.register', [], 0, null, function() {

                // Tenta realizar o login via post.
                if(brACPSlim::getInstance()->accountRegister())
                    return ['message' => ['success' => 'Conta criada com sucesso. Você já pode realizar login agora.']];

                // Por default retorna o erro.
                return ['message' => ['error' => 'Nome de usuário já cadastrado. Tente novamente!']];
            });
        });

        /*********************
        **********************
        **** DELETE - ROUTES **
        **********************
        **********************/

        /*********************
        **********************
        **** PUT - ROUTES ****
        **********************
        **********************/

        // Calls next middleware.
        $this->next->call();
    }
}
