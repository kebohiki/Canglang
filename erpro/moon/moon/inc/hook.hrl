%% **********************
%% 挂机系统数据结构
%% @author  wpf
%% wprehard@qq.com
%% **********************

%% ----------------------
%% 挂机战斗

-record(hook, {
        is_hook = 0     %% 0:没有挂机 1:挂机中
        ,cnt = 0        %% 剩余挂机次数
        ,last_time = 0  %% 上次挂机时间
    }).

%% 开始挂机
%% 取消挂机
%% 获取剩余挂机次数
%% ******************* 以下vip功能
%% 自动喂养宠物
%% 自动整理背包
%% 自动修理耐久
%% 优先击杀任务怪，否则只杀附近的怪



%% -----------------------
%% 离线挂机修炼
