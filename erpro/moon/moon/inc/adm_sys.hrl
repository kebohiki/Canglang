%%----------------------------------------------------
%% 后台管理数据定义
%% @author yjbgwxf@gmail.com
%%----------------------------------------------------
%% 新注册玩家流失率
-record(new_reg_role_segment, {
        m_1 = 0                     %% 10分钟内流失
        ,m_2 = 0                    %% 20分钟内流失
        ,m_3 = 0                    %% 30分钟内流失
        ,m_4 = 0                    %% 40分钟内流失
        ,m_5 = 0                    %% 50分钟内流失
        ,h_1 = 0                    %% 1小时内流失
        ,h_2 = 0                    %% 2小时内流失
        ,h_3 = 0                    %% 3小时内流失
        ,h_4 = 0                    %% 4小时内流失
        ,h_5 = 0                    %% 5小时内流失
        ,h_6 = 0                    %% 6小时内流失
        ,h_7 = 0                    %% 7小时内流失
        ,h_8 = 0                    %% 8小时内流失
        ,h_9 = 0                    %% 9小时内流失
        ,h_10 = 0                   %% 10小时内流失
        ,h_11 = 0                   %% 11小时内流失
        ,h_12 = 0                   %% 12小时内流失
        ,h_13 = 0                   %% 13小时内流失
        ,h_14 = 0                   %% 14小时内流失
        ,h_15 = 0                   %% 15小时内流失
        ,h_16 = 0                   %% 16小时内流失
        ,h_17 = 0                   %% 17小时内流失
        ,h_18 = 0                   %% 18小时内流失
        ,h_19 = 0                   %% 19小时内流失
        ,h_20 = 0                   %% 20小时内流失
        ,h_21 = 0                   %% 21小时内流失
        ,h_22 = 0                   %% 22小时内流失
        ,h_23 = 0                   %% 23小时内流失
        ,h_24 = 0                   %% 24小时内流失
    }                               
).

