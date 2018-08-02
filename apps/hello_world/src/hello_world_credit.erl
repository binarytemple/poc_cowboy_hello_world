-module(hello_world_credit).

-export([init/2]).

init(Req0, State) ->        


exometer:update_or_create([dp_poc,transaction,credit],1),

    Req = cowboy_req:reply(200, #{                                                                                                             
        <<"content-type">> => <<"text/plain">>                                                                                                 
    }, <<"credit!">>, Req0),                                                                                                              
    {ok, Req, State}.  