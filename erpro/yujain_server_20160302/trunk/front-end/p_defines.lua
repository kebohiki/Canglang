-- Author: caochuncheng2002@gmail.com
-- Created: 2015-09-24
-- Description: proto lua config
-- This file is generated by script tool,Do not edit it.


-- Data Type Id Description:
--     1:bool
--     2:int64
--     3:int32
--     4:int16
--     5:byte
--     6:double
--     7:string
--     自定义结构从100开始标记类型
--     所有类型的数组结构1000+id


local p_defines={
    -- p_key_value type id=100
    -- Feilds={key,value}
    -- p_key_value={{optional,int32},{repeated,int32}}
    [100]={3,"key",1003,"value"},

    -- p_key_value2 type id=101
    -- Feilds={key,value}
    -- p_key_value2={{optional,int32},{optional,int32}}
    [101]={3,"key",3,"value"},

    -- p_chat_role type id=102
    -- Feilds={role_id,role_name,category,tag}
    -- p_chat_role={{required,int64},{required,string},{optional,byte},{optional,int16}}
    [102]={2,"role_id",7,"role_name",5,"category",4,"tag"},

    -- p_chat_title type id=103
    -- Feilds={name,color}
    -- p_chat_title={{required,string},{optional,string}}
    [103]={7,"name",7,"color"},

    -- p_title type id=104
    -- Feilds={code}
    -- p_title={{required,int32}}
    [104]={3,"code"},

    -- p_pos type id=105
    -- Feilds={x,y}
    -- p_pos={{required,int32},{required,int32}}
    [105]={3,"x",3,"y"},

    -- p_map_tile type id=106
    -- Feilds={tx,ty,dir}
    -- p_map_tile={{required,int32},{required,int32},{required,byte}}
    [106]={3,"tx",3,"ty",5,"dir"},

    -- p_map_pos type id=107
    -- Feilds={tx,ty,x,y}
    -- p_map_pos={{required,int32},{required,int32},{required,int32},{required,int32}}
    [107]={3,"tx",3,"ty",3,"x",3,"y"},

    -- p_attr type id=108
    -- Feilds={uid,attr_code,int_value,string_value}
    -- p_attr={{required,int64},{required,int16},{optional,int64},{optional,string}}
    [108]={2,"uid",4,"attr_code",2,"int_value",7,"string_value"},

    -- p_role_info type id=109
    -- Feilds={role_id,role_name,sex,skin,faction_id,category,level,family_id,family_name}
    -- p_role_info={{required,int64},{required,string},{required,byte},{required,p_skin},{required,byte},{required,byte},{required,int16},{required,int64},{required,string}}
    [109]={2,"role_id",7,"role_name",5,"sex",116,"skin",5,"faction_id",5,"category",4,"level",2,"family_id",7,"family_name"},

    -- p_role_base type id=110
    -- Feilds={role_id,server_id,role_name,account_via,account_name,account_type,account_status,create_time,sex,skin,faction_id,category,exp,next_level_exp,level,family_id,family_name,couple_id,couple_name,team_id,is_pay,total_gold,gold,silver,coin,activity,gongxun,device_id,last_device_id,last_login_ip,last_login_time,last_offline_time,total_online_time,energy}
    -- p_role_base={{required,int64},{required,int16},{required,string},{required,string},{required,string},{required,byte},{required,byte},{required,int32},{required,byte},{required,p_skin},{required,byte},{required,byte},{required,int64},{required,int64},{required,int16},{required,int64},{required,string},{required,int64},{required,string},{required,int32},{required,byte},{required,int64},{required,int64},{required,int64},{required,int64},{required,int32},{required,int32},{required,string},{required,string},{required,string},{required,int32},{required,int32},{required,int32},{required,int32}}
    [110]={2,"role_id",4,"server_id",7,"role_name",7,"account_via",7,"account_name",5,"account_type",5,"account_status",3,"create_time",5,"sex",116,"skin",5,"faction_id",5,"category",2,"exp",2,"next_level_exp",4,"level",2,"family_id",7,"family_name",2,"couple_id",7,"couple_name",3,"team_id",5,"is_pay",2,"total_gold",2,"gold",2,"silver",2,"coin",3,"activity",3,"gongxun",7,"device_id",7,"last_device_id",7,"last_login_ip",3,"last_login_time",3,"last_offline_time",3,"total_online_time",3,"energy"},

    -- p_role_attr type id=111
    -- Feilds={role_id,b_power,b_magic,b_body,b_spirit,b_agile,add_attr_dot,power,magic,body,spirit,agile,attr}
    -- p_role_attr={{required,int64},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,p_fight_attr}}
    [111]={2,"role_id",3,"b_power",3,"b_magic",3,"b_body",3,"b_spirit",3,"b_agile",3,"add_attr_dot",3,"power",3,"magic",3,"body",3,"spirit",3,"agile",112,"attr"},

    -- p_fight_attr type id=112
    -- Feilds={max_hp,hp,max_mp,mp,max_anger,anger,phy_attack,magic_attack,phy_defence,magic_defence,hit,miss,double_attack,tough,seal,anti_seal,cure_effect,attack_skill,phy_defence_skill,magic_defence_skill,seal_skill,move_speed}
    -- p_fight_attr={{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32}}
    [112]={3,"max_hp",3,"hp",3,"max_mp",3,"mp",3,"max_anger",3,"anger",3,"phy_attack",3,"magic_attack",3,"phy_defence",3,"magic_defence",3,"hit",3,"miss",3,"double_attack",3,"tough",3,"seal",3,"anti_seal",3,"cure_effect",3,"attack_skill",3,"phy_defence_skill",3,"magic_defence_skill",3,"seal_skill",3,"move_speed"},

    -- p_role_ext type id=113
    -- Feilds={role_id,real_name,sex,signature,birthday,constellation,country,province,city,blog,qq,weixin,weibo}
    -- p_role_ext={{required,int64},{required,string},{required,byte},{optional,string},{optional,int32},{optional,int32},{optional,int32},{optional,int32},{optional,int32},{optional,string},{optional,string},{optional,string},{optional,string}}
    [113]={2,"role_id",7,"real_name",5,"sex",7,"signature",3,"birthday",3,"constellation",3,"country",3,"province",3,"city",7,"blog",7,"qq",7,"weixin",7,"weibo"},

    -- p_role type id=114
    -- Feilds={base,attr,group_id,buffs}
    -- p_role={{required,p_role_base},{required,p_role_attr},{required,byte},{repeated,int16}}
    [114]={110,"base",111,"attr",5,"group_id",1004,"buffs"},

    -- p_bag_content type id=115
    -- Feilds={bag_id,goods_list,grid_number}
    -- p_bag_content={{required,byte},{repeated,p_goods},{required,int16}}
    [115]={5,"bag_id",1131,"goods_list",4,"grid_number"},

    -- p_skin type id=116
    -- Feilds={fashion_id,arms_id,wing_id}
    -- p_skin={{required,int32},{required,int32},{required,int32}}
    [116]={3,"fashion_id",3,"arms_id",3,"wing_id"},

    -- p_map_role type id=117
    -- Feilds={role_id,role_name,skin,faction_id,level,sex,category,family_id,family_name,team_id,pos,walk_pos,status,max_hp,hp,move_speed,group_id,buffs,skill_state}
    -- p_map_role={{required,int64},{required,string},{required,p_skin},{required,byte},{required,int16},{optional,byte},{optional,byte},{required,int64},{required,string},{required,int32},{required,p_pos},{required,p_pos},{required,byte},{required,int32},{required,int32},{required,int32},{required,byte},{repeated,int16},{required,p_actor_skill_state}}
    [117]={2,"role_id",7,"role_name",116,"skin",5,"faction_id",4,"level",5,"sex",5,"category",2,"family_id",7,"family_name",3,"team_id",105,"pos",105,"walk_pos",5,"status",3,"max_hp",3,"hp",3,"move_speed",5,"group_id",1004,"buffs",128,"skill_state"},

    -- p_attack_result type id=118
    -- Feilds={dest_id,dest_type,cur_hp,cur_mp,cur_angle,unit_list}
    -- p_attack_result={{required,int64},{optional,byte},{optional,int32},{optional,int32},{optional,int32},{repeated,p_attack_result_unit}}
    [118]={2,"dest_id",5,"dest_type",3,"cur_hp",3,"cur_mp",3,"cur_angle",1119,"unit_list"},

    -- p_attack_result_unit type id=119
    -- Feilds={result_type,result_value,hurt_type}
    -- p_attack_result_unit={{optional,int32},{optional,int32},{optional,byte}}
    [119]={3,"result_type",3,"result_value",5,"hurt_type"},

    -- p_attack_result_buff type id=120
    -- Feilds={result_type,result_value,buff_id}
    -- p_attack_result_buff={{optional,int32},{optional,int32},{optional,int16}}
    [120]={3,"result_type",3,"result_value",4,"buff_id"},

    -- p_actor_skill type id=121
    -- Feilds={skill_id,level}
    -- p_actor_skill={{required,int32},{required,int16}}
    [121]={3,"skill_id",4,"level"},

    -- p_actor_buff type id=122
    -- Feilds={buff_id,remain_life}
    -- p_actor_buff={{required,int16},{required,int32}}
    [122]={4,"buff_id",3,"remain_life"},

    -- p_role_pet type id=123
    -- Feilds={role_id,attack_skill,phy_defence_skill,magic_defence_skill,seal_skill}
    -- p_role_pet={{required,int64},{required,int32},{required,int32},{required,int32},{required,int32}}
    [123]={2,"role_id",3,"attack_skill",3,"phy_defence_skill",3,"magic_defence_skill",3,"seal_skill"},

    -- p_pet_tiny type id=124
    -- Feilds={pet_id,pet_name,type_id,bind}
    -- p_pet_tiny={{required,int64},{required,string},{required,int32},{required,byte}}
    [124]={2,"pet_id",7,"pet_name",3,"type_id",5,"bind"},

    -- p_pet type id=125
    -- Feilds={pet_id,role_id,pet_name,type_id,status,bind,life,inborn,exp,next_level_exp,level,hp_aptitude,mp_aptitude,phy_attack_aptitude,magic_attack_aptitude,phy_defence_aptitude,magic_defence_aptitude,miss_aptitude,i_power,i_magic,i_body,i_spirit,i_agile,b_power,b_magic,b_body,b_spirit,b_agile,add_attr_dot,power,magic,body,spirit,agile,attr,skills,group_id,buffs}
    -- p_pet={{required,int64},{required,int64},{required,string},{required,int32},{required,byte},{required,byte},{required,int32},{required,int32},{required,int64},{required,int64},{required,int16},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,int32},{required,p_fight_attr},{repeated,p_actor_skill},{required,byte},{repeated,int16}}
    [125]={2,"pet_id",2,"role_id",7,"pet_name",3,"type_id",5,"status",5,"bind",3,"life",3,"inborn",2,"exp",2,"next_level_exp",4,"level",3,"hp_aptitude",3,"mp_aptitude",3,"phy_attack_aptitude",3,"magic_attack_aptitude",3,"phy_defence_aptitude",3,"magic_defence_aptitude",3,"miss_aptitude",3,"i_power",3,"i_magic",3,"i_body",3,"i_spirit",3,"i_agile",3,"b_power",3,"b_magic",3,"b_body",3,"b_spirit",3,"b_agile",3,"add_attr_dot",3,"power",3,"magic",3,"body",3,"spirit",3,"agile",112,"attr",1121,"skills",5,"group_id",1004,"buffs"},

    -- p_map_pet type id=126
    -- Feilds={pet_id,pet_name,role_id,type_id,level,pos,walk_pos,status,max_hp,hp,move_speed,group_id,buffs,skill_state}
    -- p_map_pet={{required,int64},{required,string},{required,int64},{required,int32},{required,int16},{required,p_pos},{required,p_pos},{required,byte},{required,int32},{required,int32},{required,int32},{required,byte},{repeated,int16},{required,p_actor_skill_state}}
    [126]={2,"pet_id",7,"pet_name",2,"role_id",3,"type_id",4,"level",105,"pos",105,"walk_pos",5,"status",3,"max_hp",3,"hp",3,"move_speed",5,"group_id",1004,"buffs",128,"skill_state"},

    -- p_map_monster type id=127
    -- Feilds={monster_id,monster_name,type_id,map_id,status,pos,dir,walk_pos,move_speed,max_hp,hp,group_id,buffs,skill_state}
    -- p_map_monster={{required,int64},{required,string},{required,int32},{required,int16},{required,byte},{required,p_pos},{required,byte},{required,p_pos},{required,int32},{required,int32},{required,int32},{required,byte},{repeated,int16},{required,p_actor_skill_state}}
    [127]={2,"monster_id",7,"monster_name",3,"type_id",4,"map_id",5,"status",105,"pos",5,"dir",105,"walk_pos",3,"move_speed",3,"max_hp",3,"hp",5,"group_id",1004,"buffs",128,"skill_state"},

    -- p_actor_skill_state type id=128
    -- Feilds={skill_id,level,start_time,state,effect_pos}
    -- p_actor_skill_state={{required,int32},{required,int16},{required,int64},{required,byte},{repeated,p_pos}}
    [128]={3,"skill_id",4,"level",2,"start_time",5,"state",1105,"effect_pos"},

    -- p_map_avatar type id=129
    -- Feilds={avatar_id,role_id,role_name,family_id,family_name,pos,skin}
    -- p_map_avatar={{required,int64},{required,int64},{required,string},{required,int64},{required,string},{required,p_pos},{required,p_skin}}
    [129]={2,"avatar_id",2,"role_id",7,"role_name",2,"family_id",7,"family_name",105,"pos",116,"skin"},

    -- p_tiny_goods type id=130
    -- Feilds={id,via,type,type_id,number}
    -- p_tiny_goods={{required,int64},{required,byte},{required,byte},{required,int32},{required,int16}}
    [130]={2,"id",5,"via",5,"type",3,"type_id",4,"number"},

    -- p_goods type id=131
    -- Feilds={id,via,type,type_id,target_id,load_position,bag_id,bag_position,number,status,start_time,end_time,cur_endurance,sum_endurance,punch_num,equip_stone,power,level,attributes}
    -- p_goods={{required,int64},{required,byte},{required,byte},{required,int32},{required,int64},{optional,int16},{required,byte},{required,int16},{required,int16},{optional,byte},{optional,int32},{optional,int32},{optional,int32},{optional,int32},{optional,byte},{repeated,p_equip_stone},{optional,int32},{optional,byte},{repeated,p_attribute}}
    [131]={2,"id",5,"via",5,"type",3,"type_id",2,"target_id",4,"load_position",5,"bag_id",4,"bag_position",4,"number",5,"status",3,"start_time",3,"end_time",3,"cur_endurance",3,"sum_endurance",5,"punch_num",1133,"equip_stone",3,"power",5,"level",1132,"attributes"},

    -- p_attribute type id=132
    -- Feilds={id,val}
    -- p_attribute={{required,byte},{required,int32}}
    [132]={5,"id",3,"val"},

    -- p_equip_stone type id=133
    -- Feilds={type_id,in_pos}
    -- p_equip_stone={{required,int32},{required,byte}}
    [133]={3,"type_id",5,"in_pos"},

    -- p_letter_info type id=134
    -- Feilds={id,sender,receiver,title,send_time,type,goods_list,state,letter_content,is_send}
    -- p_letter_info={{required,int32},{required,string},{required,string},{required,string},{required,int32},{required,byte},{repeated,p_goods},{required,byte},{optional,string},{optional,bool}}
    [134]={3,"id",7,"sender",7,"receiver",7,"title",3,"send_time",5,"type",1131,"goods_list",5,"state",7,"letter_content",1,"is_send"},

    -- p_letter_simple_info type id=135
    -- Feilds={id,sender,receiver,title,send_time,type,state,is_have_goods,is_send}
    -- p_letter_simple_info={{required,int32},{required,string},{optional,string},{optional,string},{required,int32},{required,int32},{required,int32},{required,bool},{optional,bool}}
    [135]={3,"id",7,"sender",7,"receiver",7,"title",3,"send_time",3,"type",3,"state",1,"is_have_goods",1,"is_send"},

    -- p_mission_info type id=136
    -- Feilds={id,current_status,current_model_status,commit_times,succ_times,color,listener_list}
    -- p_mission_info={{required,int32},{required,byte},{required,byte},{required,int16},{required,int16},{required,byte},{repeated,p_mission_listener}}
    [136]={3,"id",5,"current_status",5,"current_model_status",4,"commit_times",4,"succ_times",5,"color",1137,"listener_list"},

    -- p_mission_listener type id=137
    -- Feilds={type,sub_type,value,need_num,current_num}
    -- p_mission_listener={{required,byte},{required,int16},{required,int32},{required,int32},{required,int32}}
    [137]={5,"type",4,"sub_type",3,"value",3,"need_num",3,"current_num"},

    -- p_mission_reward type id=138
    -- Feilds={exp,silver,coin,goods_list}
    -- p_mission_reward={{optional,int64},{optional,int64},{optional,int64},{repeated,p_goods}}
    [138]={2,"exp",2,"silver",2,"coin",1131,"goods_list"},

    -- p_mission_auto type id=139
    -- Feilds={big_group,mission_id,role_level,rollback_times,cur_times,status,start_time,end_time,max_loop_times,loop_times,color}
    -- p_mission_auto={{required,int32},{required,int32},{required,int16},{required,int16},{required,int16},{required,byte},{required,int32},{required,int32},{required,byte},{required,byte},{required,byte}}
    [139]={3,"big_group",3,"mission_id",4,"role_level",4,"rollback_times",4,"cur_times",5,"status",3,"start_time",3,"end_time",5,"max_loop_times",5,"loop_times",5,"color"},

    -- p_customer_service type id=140
    -- Feilds={id,reply_id,type,title,content,op_time,status}
    -- p_customer_service={{optional,int32},{optional,int32},{optional,byte},{optional,string},{optional,string},{optional,int32},{optional,byte}}
    [140]={3,"id",3,"reply_id",5,"type",7,"title",7,"content",3,"op_time",5,"status"},

    -- p_family type id=141
    -- Feilds={family_id,family_name,owner_role_id,owner_role_name,faction_id,level,create_time,cur_pop,max_pop,icon_level,total_contribute,public_notice,private_notice,qq,member_list,request_list}
    -- p_family={{required,int64},{required,string},{required,int64},{required,string},{required,byte},{required,int16},{required,int32},{required,int16},{required,int16},{required,byte},{required,int64},{required,string},{required,string},{required,string},{repeated,p_family_member},{repeated,p_family_request}}
    [141]={2,"family_id",7,"family_name",2,"owner_role_id",7,"owner_role_name",5,"faction_id",4,"level",3,"create_time",4,"cur_pop",4,"max_pop",5,"icon_level",2,"total_contribute",7,"public_notice",7,"private_notice",7,"qq",1142,"member_list",1143,"request_list"},

    -- p_family_member type id=142
    -- Feilds={role_id,role_name,sex,level,last_login_time,is_online,office_code,cur_contribute,total_contribute,qq}
    -- p_family_member={{required,int64},{required,string},{required,byte},{required,int16},{required,int32},{required,byte},{required,int32},{required,int64},{required,int64},{required,string}}
    [142]={2,"role_id",7,"role_name",5,"sex",4,"level",3,"last_login_time",5,"is_online",3,"office_code",2,"cur_contribute",2,"total_contribute",7,"qq"},

    -- p_family_request type id=143
    -- Feilds={role_id,role_name,level,op_time}
    -- p_family_request={{required,int64},{required,string},{required,int16},{required,int32}}
    [143]={2,"role_id",7,"role_name",4,"level",3,"op_time"},

    -- p_family_list type id=144
    -- Feilds={family_id,family_name,owner_role_id,owner_role_name,faction_id,level,cur_pop,max_pop,total_contribute,public_notice}
    -- p_family_list={{required,int64},{required,string},{required,int64},{required,string},{required,byte},{required,int16},{required,int16},{required,int16},{required,int64},{required,string}}
    [144]={2,"family_id",7,"family_name",2,"owner_role_id",7,"owner_role_name",5,"faction_id",4,"level",4,"cur_pop",4,"max_pop",2,"total_contribute",7,"public_notice"},

    -- p_rank_row type id=145
    -- Feilds={row_id,role_id,role_name,str_list,int_list}
    -- p_rank_row={{required,int32},{required,int64},{required,string},{repeated,string},{repeated,int32}}
    [145]={3,"row_id",2,"role_id",7,"role_name",1007,"str_list",1003,"int_list"},

    -- p_role_skill type id=146
    -- Feilds={skill_id,level}
    -- p_role_skill={{required,int32},{required,int32}}
    [146]={3,"skill_id",3,"level"},

    -- p_fb type id=147
    -- Feilds={fb_id,fb_times}
    -- p_fb={{required,int16},{optional,int16}}
    [147]={4,"fb_id",4,"fb_times"},

    -- p_team_member type id=148
    -- Feilds={role_id,role_name,sex,category,faction_id,level,family_id,is_leader,is_follow,offline_time,hp,max_hp,map_id,tx,ty,skin}
    -- p_team_member={{required,int64},{required,string},{required,byte},{required,byte},{required,byte},{required,int16},{required,int64},{required,byte},{required,byte},{required,int32},{required,int32},{required,int32},{required,int16},{required,int32},{required,int32},{required,p_skin}}
    [148]={2,"role_id",7,"role_name",5,"sex",5,"category",5,"faction_id",4,"level",2,"family_id",5,"is_leader",5,"is_follow",3,"offline_time",3,"hp",3,"max_hp",4,"map_id",3,"tx",3,"ty",116,"skin"}
}

return p_defines