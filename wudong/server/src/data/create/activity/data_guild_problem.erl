%%%---------------------------------------
	%%% @Author  : 苍狼工作室
	%%% @Module  : data_guild_problem
	%%% @Created : 2018-04-25 17:41:52
	%%% @Description:  自动生成
	%%%---------------------------------------
-module(data_guild_problem).
-export([get/1]).
-export([get_all/0]).
-include("activity.hrl").
get(1) -> {?T("你现在还保留着初吻吗？"), ?T("")};
get(2) -> {?T("如果男生因为某些事暂时忽略你，你会不会生气？"), ?T("")};
get(3) -> {?T("你是否会非常在意自己的另一半不是第一次？"), ?T("")};
get(4) -> {?T("爱一个人怎样表达，能够得到芳心？"), ?T("")};
get(5) -> {?T("如果情敌掉水里了，你会怎样样？"), ?T("")};
get(6) -> {?T("你会不会介意自己的另一半整过容？"), ?T("")};
get(7) -> {?T("男/女朋友与好哥们/好姐妹谁更加重要？"), ?T("")};
get(8) -> {?T("你对另一半喜欢裸睡持什么态度呢？"), ?T("")};
get(9) -> {?T("你会为了爱情牺牲一切，包括生命吗？ "), ?T("")};
get(10) -> {?T("男女朋友分手后还能做普通朋友吗？"), ?T("")};
get(11) -> {?T("你在决定婚姻的时候，物质和感情占怎么样的比重？"), ?T("")};
get(12) -> {?T("你会接受平胸MM吗？"), ?T("")};
get(13) -> {?T("对于女生的话，你觉得该不该花男友的钱？"), ?T("")};
get(14) -> {?T("你接受姐弟恋吗？ 几岁的范围可以接受？"), ?T("")};
get(15) -> {?T("你有没有过和其他非恋爱关系的异性有暧昧关系？"), ?T("")};
get(16) -> {?T("你支持婚前性行为么？"), ?T("")};
get(17) -> {?T("很穷的情况下，你愿意为了两百元帮一个不认识男人洗内裤么？"), ?T("")};
get(18) -> {?T("因为看多了偶像剧，会幻想自己小时候被抱错，其实真正的父母是高富帅和白富美吗？"), ?T("")};
get(19) -> {?T("看到了买罩罩的性感广告，会停留一下吗？"), ?T("")};
get(20) -> {?T("如果能预知未来，你最不希望看见的是什么？"), ?T("")};
get(21) -> {?T("你的前任和你现任同时约你，你会陪谁？"), ?T("")};
get(22) -> {?T("比起高朋满座，你是否更喜欢独自一人？"), ?T("")};
get(23) -> {?T("如果跟你喜欢的人约会，碰到前任的男（女）朋友，会有什么表现？ "), ?T("")};
get(24) -> {?T("如果有一天你和你的好友吵架了，你会先认错么？"), ?T("")};
get(25) -> {?T("自己上学的时候能否挂过科？"), ?T("")};
get(26) -> {?T("你是否介意过自己的另一半胸太小？"), ?T("")};
get(27) -> {?T("你对异地恋的看法是怎么样的呢？"), ?T("")};
get(28) -> {?T("高中时期你是否有过暗恋的对象呢？"), ?T("")};
get(29) -> {?T("如果可以，你希望自己在30岁前结婚吗"), ?T("")};
get(30) -> {?T("如果明天就是世界末日，你希望谁能陪在你身边"), ?T("")};
get(_id) -> [].

get_all() -> [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30].