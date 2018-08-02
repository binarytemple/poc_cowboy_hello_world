-module(hello_world_debit).

-export([init/2]).

init(Req0, State) ->    



exometer:update_or_create([dp_poc,transaction,debit],1),

    Req = cowboy_req:reply(200, #{                                                                                                             
        <<"content-type">> => <<"text/plain">>                                                                                                 
    }, <<"debit!">>, Req0),                                                                                                              
    {ok, Req, State}.  