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

var grecaptcha_timer = false;

+function($)
{

    $(document).on('click', '.url-link', function() {
        window.location.href = $(this).data('href');
    });

    $(document).on('click', '.modal-trigger-check', function() {
        var checked = $(this).prop('checked');

        $('.modal-trigger-check').each(function() {
            $(this).prop('checked', false);
        })

        $(this).prop('checked', checked);
    });

} (window.jQuery);
