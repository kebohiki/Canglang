%%----------------------------------------------------
%% 通用兑换服务
%% @author mobin
%% @end
%% 
%%----------------------------------------------------

-record(change_item, {
        id = 0              %% ID
        ,base_id = 0        %% 物品ID
        ,price = 9999       %% 价格
        ,count = 0          %% 限购数量
        ,bind = 0           %% 是否绑定
        ,limit = 0          %% 限制，不同模块不同表示
    }
).