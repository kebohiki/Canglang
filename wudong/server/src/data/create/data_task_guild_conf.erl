%%%---------------------------------------
	%%% @Author  : 苍狼工作室
	%%% @Module  : data_task_guild_conf
	%%% @Created : 2017-10-12 17:28:45
	%%% @Description:  自动生成
	%%%---------------------------------------
-module(data_task_guild_conf).
-export([min_lv/0]).
-export([get_task/1]).
-include("common.hrl").
-include("task.hrl").

    min_lv() ->48.
get_task(Lv)when Lv>=48 andalso Lv=<80->[400101,400102,400103,400104,400105,400106,400107,400108,400109,400110,400111,400112,400113,400114,400115,400116,400117,400118,400119,400120,400121,400122,400123,400124,400125,400126,400127,400128,400129,400130];
get_task(Lv)when Lv>=81 andalso Lv=<85->[400201,400202,400203,400204,400205,400206,400207,400208,400209,400210,400211,400212,400213,400214,400215,400216,400217,400218,400219,400220,400221,400222,400223,400224,400225,400226,400227,400228,400229,400230];
get_task(Lv)when Lv>=86 andalso Lv=<88->[400301,400302,400303,400304,400305,400306,400307,400308,400309,400310,400311,400312,400313,400314,400315,400316,400317,400318,400319,400320,400321,400322,400323,400324,400325,400326,400327,400328,400329,400330];
get_task(Lv)when Lv>=89 andalso Lv=<91->[400401,400402,400403,400404,400405,400406,400407,400408,400409,400410,400411,400412,400413,400414,400415,400416,400417,400418,400419,400420,400421,400422,400423,400424,400425,400426,400427,400428,400429,400430];
get_task(Lv)when Lv>=92 andalso Lv=<93->[400501,400502,400503,400504,400505,400506,400507,400508,400509,400510,400511,400512,400513,400514,400515,400516,400517,400518,400519,400520,400521,400522,400523,400524,400525,400526,400527,400528,400529,400530];
get_task(Lv)when Lv>=94 andalso Lv=<95->[400601,400602,400603,400604,400605,400606,400607,400608,400609,400610,400611,400612,400613,400614,400615,400616,400617,400618,400619,400620,400621,400622,400623,400624,400625,400626,400627,400628,400629,400630];
get_task(Lv)when Lv>=96 andalso Lv=<96->[400701,400702,400703,400704,400705,400706,400707,400708,400709,400710,400711,400712,400713,400714,400715,400716,400717,400718,400719,400720,400721,400722,400723,400724,400725,400726,400727,400728,400729,400730];
get_task(Lv)when Lv>=97 andalso Lv=<105->[400801,400802,400803,400804,400805,400806,400807,400808,400809,400810,400811,400812,400813,400814,400815,400816,400817,400818,400819,400820,400821,400822,400823,400824,400825,400826,400827,400828,400829,400830];
get_task(Lv)when Lv>=106 andalso Lv=<120->[400901,400902,400903,400904,400905,400906,400907,400908,400909,400910,400911,400912,400913,400914,400915,400916,400917,400918,400919,400920,400921,400922,400923,400924,400925,400926,400927,400928,400929,400930];
get_task(Lv)when Lv>=121 andalso Lv=<132->[401001,401002,401003,401004,401005,401006,401007,401008,401009,401010,401011,401012,401013,401014,401015,401016,401017,401018,401019,401020,401021,401022,401023,401024,401025,401026,401027,401028,401029,401030];
get_task(Lv)when Lv>=133 andalso Lv=<147->[401101,401102,401103,401104,401105,401106,401107,401108,401109,401110,401111,401112,401113,401114,401115,401116,401117,401118,401119,401120,401121,401122,401123,401124,401125,401126,401127,401128,401129,401130];
get_task(Lv)when Lv>=148 andalso Lv=<162->[401201,401202,401203,401204,401205,401206,401207,401208,401209,401210,401211,401212,401213,401214,401215,401216,401217,401218,401219,401220,401221,401222,401223,401224,401225,401226,401227,401228,401229,401230];
get_task(Lv)when Lv>=163 andalso Lv=<177->[401301,401302,401303,401304,401305,401306,401307,401308,401309,401310,401311,401312,401313,401314,401315,401316,401317,401318,401319,401320,401321,401322,401323,401324,401325,401326,401327,401328,401329,401330];
get_task(Lv)when Lv>=178 andalso Lv=<197->[401401,401402,401403,401404,401405,401406,401407,401408,401409,401410,401411,401412,401413,401414,401415,401416,401417,401418,401419,401420,401421,401422,401423,401424,401425,401426,401427,401428,401429,401430];
get_task(Lv)when Lv>=198 andalso Lv=<217->[401501,401502,401503,401504,401505,401506,401507,401508,401509,401510,401511,401512,401513,401514,401515,401516,401517,401518,401519,401520,401521,401522,401523,401524,401525,401526,401527,401528,401529,401530];
get_task(Lv)when Lv>=218 andalso Lv=<247->[401601,401602,401603,401604,401605,401606,401607,401608,401609,401610,401611,401612,401613,401614,401615,401616,401617,401618,401619,401620,401621,401622,401623,401624,401625,401626,401627,401628,401629,401630];
get_task(Lv)when Lv>=248 andalso Lv=<277->[401701,401702,401703,401704,401705,401706,401707,401708,401709,401710,401711,401712,401713,401714,401715,401716,401717,401718,401719,401720,401721,401722,401723,401724,401725,401726,401727,401728,401729,401730];
get_task(Lv)when Lv>=278 andalso Lv=<307->[401801,401802,401803,401804,401805,401806,401807,401808,401809,401810,401811,401812,401813,401814,401815,401816,401817,401818,401819,401820,401821,401822,401823,401824,401825,401826,401827,401828,401829,401830];
get_task(Lv)when Lv>=308 andalso Lv=<337->[401901,401902,401903,401904,401905,401906,401907,401908,401909,401910,401911,401912,401913,401914,401915,401916,401917,401918,401919,401920,401921,401922,401923,401924,401925,401926,401927,401928,401929,401930];
get_task(Lv)when Lv>=338 andalso Lv=<367->[402001,402002,402003,402004,402005,402006,402007,402008,402009,402010,402011,402012,402013,402014,402015,402016,402017,402018,402019,402020,402021,402022,402023,402024,402025,402026,402027,402028,402029,402030];
get_task(Lv)when Lv>=368 andalso Lv=<387->[402101,402102,402103,402104,402105,402106,402107,402108,402109,402110,402111,402112,402113,402114,402115,402116,402117,402118,402119,402120,402121,402122,402123,402124,402125,402126,402127,402128,402129,402130];
get_task(_) -> [].