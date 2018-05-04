%% Author: caochuncheng2002@gmail.com
%% Created: 2013-7-15
%% Description: 日志类型宏定义，此文件不可以修改，由log.xml生成


-define(LOG_GAIN_GOLD_PAY,110000). %% 充值获得
-define(LOG_GAIN_GOLD_ADMIN_PAY,110001). %% 后台充值获得
-define(LOG_GAIN_GOLD_MISSION,110002). %% 后台充值获得
-define(LOG_GAIN_GOLD_GOODS_USE,110003). %% 使用物品获得
-define(LOG_CONSUME_GOLD_SHOP_BUY,120000). %% 商店购买失去
-define(LOG_CONSUME_GOLD_MISSION_DO_COMPLETE,120001). %% 立即完成任务失去
-define(LOG_CONSUME_GOLD_MISSION_DO_SUBMIT,120002). %% 完成并提交任务失去
-define(LOG_CONSUME_GOLD_MISSION_RECOLOR,120003). %% 刷新任务品质失去
-define(LOG_CONSUME_GOLD_MISSION_AUTO,120004). %% 委托任务失去
-define(LOG_CONSUME_GOLD_MISSION_AUTO_SPEED_UP,120005). %% 委托加速失去
-define(LOG_CONSUME_GOLD_GOODS_OPEN_GIFT,120006). %% 打开礼包失去
-define(LOG_CONSUME_GOLD_GOODS_ADD_GRID,120007). %% 扩展仓库格子失去
-define(LOG_CONSUME_GOLD_SEND_LETTER,120008). %% 发送信件失去
-define(LOG_CONSUME_GOLD_FAMILY_CREATE,120009). %% 创建军团失去
-define(LOG_GAIN_SILVER_ADMIN_PAY,210001). %% 后台充值获得
-define(LOG_GAIN_SILVER_GOODS_USE,210002). %% 使用物品获得
-define(LOG_GAIN_SILVER_MISSION,210003). %% 完成任务获得
-define(LOG_CONSUME_SILVER_SHOP_BUY,220000). %% 商店购买失去
-define(LOG_CONSUME_SILVER_MISSION_DO_COMPLETE,220001). %% 立即完成任务失去
-define(LOG_CONSUME_SILVER_MISSION_DO_SUBMIT,220002). %% 完成并提交任务失去
-define(LOG_CONSUME_SILVER_FAMILY_CREATE,220003). %% 创建帮派失去
-define(LOG_GAIN_GOODS_SHOP_BUY,310000). %% 商店购买获得
-define(LOG_GAIN_GOODS_LETTER_ACCEPT_GOODS,310001). %% 信件附件获得
-define(LOG_GAIN_GOODS_DO_MISSION,310002). %% 任务获得
-define(LOG_GAIN_GOODS_OPEN_GIFT,310003). %% 开礼包获得
-define(LOG_CONSUME_GOODS_BAG_DESTROY,320000). %% 仓库销毁物品失去
-define(LOG_CONSUME_GOODS_SALE_SHOP,320001). %% 出售系统物品失去
-define(LOG_CONSUME_GOODS_LETTER_DELETE,320002). %% 删除信件失去
-define(LOG_CONSUME_GOODS_LETTER_P2P_SEND,320003). %% 发送信件失去
-define(LOG_CONSUME_GOODS_USE,320004). %% 使用物品失去
-define(LOG_GAIN_COIN_SHOP_SALE,410000). %% 出售物品获得
-define(LOG_GAIN_COIN_ADMIN_PAY,410001). %% 后台充值获得
-define(LOG_GAIN_COIN_MISSION,410002). %% 任务奖励获得
-define(LOG_GAIN_COIN_GOODS_USE,410003). %% 使用物品获得
-define(LOG_CONSUME_COIN_SHOP_BUY_BACK,420000). %% 道具回购失去
-define(LOG_CONSUME_COIN_MISSION_RECOLOR,420001). %% 任务刷新品质失去
-define(LOG_GAIN_COMMON_GOODS_USE_CODE_REPUTE,510004). %% 使用道具获得军功
-define(LOG_GAIN_COMMON_MISSION_USE_CODE_REPUTE,510008). %% 任务奖励获得军功
-define(LOG_GAIN_COMMON_ONLINE_AWARD_REPUTE,510018). %% 在线奖励获得军功
-define(LOG_GAIN_COMMON_JOB_ACTIVE,510022). %% 活跃度励获得军功
-define(LOG_GAIN_COMMON_GOODS_USE_FRAG,510027). %% 使用道具获得武将碎片
-define(LOG_GAIN_COMMON_ENLIST_HERO_FRAG,510028). %% 招募将领获得武将碎片
-define(LOG_CONSUME_COMMON_CHAT_ENERGY,520000). %% 聊天消耗活力值
-define(LOG_CONSUME_COMMON_EXCHANGE_SHOP_REPUTE,520004). %% 兑换消耗军功
-define(LOG_CONSUME_COMMON_EXCHANGE_SHOP_GONGXUN,520005). %% 兑换消耗功勋
-define(LOG_CONSUME_COMMON_EXCHANGE_HERO_FRAG,520013). %% 交换将领消耗武将碎片
