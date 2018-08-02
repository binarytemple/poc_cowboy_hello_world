%%%-------------------------------------------------------------------
%% @doc hello_world public API
%% @end
%%%-------------------------------------------------------------------

-module(hello_world_app).

-behaviour(application).

%% Application callbacks
-export([start/2, stop/1]).

%%====================================================================
%% API
%%====================================================================

start(_StartType, _StartArgs) ->
    {ok, Pid} = hello_world_sup:start_link(),
    Routes = [ {
        '_',
        [
            {"/", hello_world_root, []}
        ]
    } ],






    % Dispatch = cowboy_router:compile(Routes),

    % NumAcceptors = 10,
    TransOpts = [ {ip, {0,0,0,0}}, {port, 2938} ],
    % ProtoOpts = [{env, [{dispatch, Dispatch}]}],

 ProtoOpts = #{                                                                                                                             
        env => #{dispatch => cowboy_router:compile(Routes)}
    % ,                                                                    
        % max_frame_size_sent => MaxFrameSize                                                                                                    
    },                                                                                                                                         
    {ok, _} = cowboy:start_clear(foo, TransOpts, ProtoOpts),     


    % {ok, _} = cowboy:start_clear(foobar,
    %     NumAcceptors, TransOpts, ProtoOpts),

    {ok, Pid}.

%%--------------------------------------------------------------------
stop(_State) ->
    ok.

%%====================================================================
%% Internal functions
%%====================================================================
