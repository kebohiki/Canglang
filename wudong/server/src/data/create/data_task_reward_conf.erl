%%%---------------------------------------
	%%% @Author  : 苍狼工作室
	%%% @Module  : data_task_reward_conf
	%%% @Created : 2017-05-09 10:56:52
	%%% @Description:  自动生成
	%%%---------------------------------------
-module(data_task_reward_conf).
-export([max_round/0]).
-export([get/2]).
-include("common.hrl").

    max_round() ->10.
get(Lv,1) when Lv >= 40 andalso Lv=< 55->900101;
get(Lv,2) when Lv >= 40 andalso Lv=< 55->900102;
get(Lv,3) when Lv >= 40 andalso Lv=< 55->900103;
get(Lv,4) when Lv >= 40 andalso Lv=< 55->900104;
get(Lv,5) when Lv >= 40 andalso Lv=< 55->900105;
get(Lv,6) when Lv >= 40 andalso Lv=< 55->900106;
get(Lv,7) when Lv >= 40 andalso Lv=< 55->900107;
get(Lv,8) when Lv >= 40 andalso Lv=< 55->900108;
get(Lv,9) when Lv >= 40 andalso Lv=< 55->900109;
get(Lv,10) when Lv >= 40 andalso Lv=< 55->900110;
get(Lv,1) when Lv >= 56 andalso Lv=< 60->900201;
get(Lv,2) when Lv >= 56 andalso Lv=< 60->900202;
get(Lv,3) when Lv >= 56 andalso Lv=< 60->900203;
get(Lv,4) when Lv >= 56 andalso Lv=< 60->900204;
get(Lv,5) when Lv >= 56 andalso Lv=< 60->900205;
get(Lv,6) when Lv >= 56 andalso Lv=< 60->900206;
get(Lv,7) when Lv >= 56 andalso Lv=< 60->900207;
get(Lv,8) when Lv >= 56 andalso Lv=< 60->900208;
get(Lv,9) when Lv >= 56 andalso Lv=< 60->900209;
get(Lv,10) when Lv >= 56 andalso Lv=< 60->900210;
get(Lv,1) when Lv >= 61 andalso Lv=< 63->900301;
get(Lv,2) when Lv >= 61 andalso Lv=< 63->900302;
get(Lv,3) when Lv >= 61 andalso Lv=< 63->900303;
get(Lv,4) when Lv >= 61 andalso Lv=< 63->900304;
get(Lv,5) when Lv >= 61 andalso Lv=< 63->900305;
get(Lv,6) when Lv >= 61 andalso Lv=< 63->900306;
get(Lv,7) when Lv >= 61 andalso Lv=< 63->900307;
get(Lv,8) when Lv >= 61 andalso Lv=< 63->900308;
get(Lv,9) when Lv >= 61 andalso Lv=< 63->900309;
get(Lv,10) when Lv >= 61 andalso Lv=< 63->900310;
get(Lv,1) when Lv >= 64 andalso Lv=< 66->900401;
get(Lv,2) when Lv >= 64 andalso Lv=< 66->900402;
get(Lv,3) when Lv >= 64 andalso Lv=< 66->900403;
get(Lv,4) when Lv >= 64 andalso Lv=< 66->900404;
get(Lv,5) when Lv >= 64 andalso Lv=< 66->900405;
get(Lv,6) when Lv >= 64 andalso Lv=< 66->900406;
get(Lv,7) when Lv >= 64 andalso Lv=< 66->900407;
get(Lv,8) when Lv >= 64 andalso Lv=< 66->900408;
get(Lv,9) when Lv >= 64 andalso Lv=< 66->900409;
get(Lv,10) when Lv >= 64 andalso Lv=< 66->900410;
get(Lv,1) when Lv >= 67 andalso Lv=< 68->900501;
get(Lv,2) when Lv >= 67 andalso Lv=< 68->900502;
get(Lv,3) when Lv >= 67 andalso Lv=< 68->900503;
get(Lv,4) when Lv >= 67 andalso Lv=< 68->900504;
get(Lv,5) when Lv >= 67 andalso Lv=< 68->900505;
get(Lv,6) when Lv >= 67 andalso Lv=< 68->900506;
get(Lv,7) when Lv >= 67 andalso Lv=< 68->900507;
get(Lv,8) when Lv >= 67 andalso Lv=< 68->900508;
get(Lv,9) when Lv >= 67 andalso Lv=< 68->900509;
get(Lv,10) when Lv >= 67 andalso Lv=< 68->900510;
get(Lv,1) when Lv >= 69 andalso Lv=< 70->900601;
get(Lv,2) when Lv >= 69 andalso Lv=< 70->900602;
get(Lv,3) when Lv >= 69 andalso Lv=< 70->900603;
get(Lv,4) when Lv >= 69 andalso Lv=< 70->900604;
get(Lv,5) when Lv >= 69 andalso Lv=< 70->900605;
get(Lv,6) when Lv >= 69 andalso Lv=< 70->900606;
get(Lv,7) when Lv >= 69 andalso Lv=< 70->900607;
get(Lv,8) when Lv >= 69 andalso Lv=< 70->900608;
get(Lv,9) when Lv >= 69 andalso Lv=< 70->900609;
get(Lv,10) when Lv >= 69 andalso Lv=< 70->900610;
get(Lv,1) when Lv >= 71 andalso Lv=< 71->900701;
get(Lv,2) when Lv >= 71 andalso Lv=< 71->900702;
get(Lv,3) when Lv >= 71 andalso Lv=< 71->900703;
get(Lv,4) when Lv >= 71 andalso Lv=< 71->900704;
get(Lv,5) when Lv >= 71 andalso Lv=< 71->900705;
get(Lv,6) when Lv >= 71 andalso Lv=< 71->900706;
get(Lv,7) when Lv >= 71 andalso Lv=< 71->900707;
get(Lv,8) when Lv >= 71 andalso Lv=< 71->900708;
get(Lv,9) when Lv >= 71 andalso Lv=< 71->900709;
get(Lv,10) when Lv >= 71 andalso Lv=< 71->900710;
get(Lv,1) when Lv >= 72 andalso Lv=< 80->900801;
get(Lv,2) when Lv >= 72 andalso Lv=< 80->900802;
get(Lv,3) when Lv >= 72 andalso Lv=< 80->900803;
get(Lv,4) when Lv >= 72 andalso Lv=< 80->900804;
get(Lv,5) when Lv >= 72 andalso Lv=< 80->900805;
get(Lv,6) when Lv >= 72 andalso Lv=< 80->900806;
get(Lv,7) when Lv >= 72 andalso Lv=< 80->900807;
get(Lv,8) when Lv >= 72 andalso Lv=< 80->900808;
get(Lv,9) when Lv >= 72 andalso Lv=< 80->900809;
get(Lv,10) when Lv >= 72 andalso Lv=< 80->900810;
get(Lv,1) when Lv >= 81 andalso Lv=< 95->900901;
get(Lv,2) when Lv >= 81 andalso Lv=< 95->900902;
get(Lv,3) when Lv >= 81 andalso Lv=< 95->900903;
get(Lv,4) when Lv >= 81 andalso Lv=< 95->900904;
get(Lv,5) when Lv >= 81 andalso Lv=< 95->900905;
get(Lv,6) when Lv >= 81 andalso Lv=< 95->900906;
get(Lv,7) when Lv >= 81 andalso Lv=< 95->900907;
get(Lv,8) when Lv >= 81 andalso Lv=< 95->900908;
get(Lv,9) when Lv >= 81 andalso Lv=< 95->900909;
get(Lv,10) when Lv >= 81 andalso Lv=< 95->900910;
get(Lv,1) when Lv >= 96 andalso Lv=< 107->901001;
get(Lv,2) when Lv >= 96 andalso Lv=< 107->901002;
get(Lv,3) when Lv >= 96 andalso Lv=< 107->901003;
get(Lv,4) when Lv >= 96 andalso Lv=< 107->901004;
get(Lv,5) when Lv >= 96 andalso Lv=< 107->901005;
get(Lv,6) when Lv >= 96 andalso Lv=< 107->901006;
get(Lv,7) when Lv >= 96 andalso Lv=< 107->901007;
get(Lv,8) when Lv >= 96 andalso Lv=< 107->901008;
get(Lv,9) when Lv >= 96 andalso Lv=< 107->901009;
get(Lv,10) when Lv >= 96 andalso Lv=< 107->901010;
get(Lv,1) when Lv >= 108 andalso Lv=< 122->901101;
get(Lv,2) when Lv >= 108 andalso Lv=< 122->901102;
get(Lv,3) when Lv >= 108 andalso Lv=< 122->901103;
get(Lv,4) when Lv >= 108 andalso Lv=< 122->901104;
get(Lv,5) when Lv >= 108 andalso Lv=< 122->901105;
get(Lv,6) when Lv >= 108 andalso Lv=< 122->901106;
get(Lv,7) when Lv >= 108 andalso Lv=< 122->901107;
get(Lv,8) when Lv >= 108 andalso Lv=< 122->901108;
get(Lv,9) when Lv >= 108 andalso Lv=< 122->901109;
get(Lv,10) when Lv >= 108 andalso Lv=< 122->901110;
get(Lv,1) when Lv >= 123 andalso Lv=< 137->901201;
get(Lv,2) when Lv >= 123 andalso Lv=< 137->901202;
get(Lv,3) when Lv >= 123 andalso Lv=< 137->901203;
get(Lv,4) when Lv >= 123 andalso Lv=< 137->901204;
get(Lv,5) when Lv >= 123 andalso Lv=< 137->901205;
get(Lv,6) when Lv >= 123 andalso Lv=< 137->901206;
get(Lv,7) when Lv >= 123 andalso Lv=< 137->901207;
get(Lv,8) when Lv >= 123 andalso Lv=< 137->901208;
get(Lv,9) when Lv >= 123 andalso Lv=< 137->901209;
get(Lv,10) when Lv >= 123 andalso Lv=< 137->901210;
get(Lv,1) when Lv >= 138 andalso Lv=< 152->901301;
get(Lv,2) when Lv >= 138 andalso Lv=< 152->901302;
get(Lv,3) when Lv >= 138 andalso Lv=< 152->901303;
get(Lv,4) when Lv >= 138 andalso Lv=< 152->901304;
get(Lv,5) when Lv >= 138 andalso Lv=< 152->901305;
get(Lv,6) when Lv >= 138 andalso Lv=< 152->901306;
get(Lv,7) when Lv >= 138 andalso Lv=< 152->901307;
get(Lv,8) when Lv >= 138 andalso Lv=< 152->901308;
get(Lv,9) when Lv >= 138 andalso Lv=< 152->901309;
get(Lv,10) when Lv >= 138 andalso Lv=< 152->901310;
get(Lv,1) when Lv >= 153 andalso Lv=< 172->901401;
get(Lv,2) when Lv >= 153 andalso Lv=< 172->901402;
get(Lv,3) when Lv >= 153 andalso Lv=< 172->901403;
get(Lv,4) when Lv >= 153 andalso Lv=< 172->901404;
get(Lv,5) when Lv >= 153 andalso Lv=< 172->901405;
get(Lv,6) when Lv >= 153 andalso Lv=< 172->901406;
get(Lv,7) when Lv >= 153 andalso Lv=< 172->901407;
get(Lv,8) when Lv >= 153 andalso Lv=< 172->901408;
get(Lv,9) when Lv >= 153 andalso Lv=< 172->901409;
get(Lv,10) when Lv >= 153 andalso Lv=< 172->901410;
get(Lv,1) when Lv >= 173 andalso Lv=< 192->901501;
get(Lv,2) when Lv >= 173 andalso Lv=< 192->901502;
get(Lv,3) when Lv >= 173 andalso Lv=< 192->901503;
get(Lv,4) when Lv >= 173 andalso Lv=< 192->901504;
get(Lv,5) when Lv >= 173 andalso Lv=< 192->901505;
get(Lv,6) when Lv >= 173 andalso Lv=< 192->901506;
get(Lv,7) when Lv >= 173 andalso Lv=< 192->901507;
get(Lv,8) when Lv >= 173 andalso Lv=< 192->901508;
get(Lv,9) when Lv >= 173 andalso Lv=< 192->901509;
get(Lv,10) when Lv >= 173 andalso Lv=< 192->901510;
get(Lv,1) when Lv >= 193 andalso Lv=< 222->901601;
get(Lv,2) when Lv >= 193 andalso Lv=< 222->901602;
get(Lv,3) when Lv >= 193 andalso Lv=< 222->901603;
get(Lv,4) when Lv >= 193 andalso Lv=< 222->901604;
get(Lv,5) when Lv >= 193 andalso Lv=< 222->901605;
get(Lv,6) when Lv >= 193 andalso Lv=< 222->901606;
get(Lv,7) when Lv >= 193 andalso Lv=< 222->901607;
get(Lv,8) when Lv >= 193 andalso Lv=< 222->901608;
get(Lv,9) when Lv >= 193 andalso Lv=< 222->901609;
get(Lv,10) when Lv >= 193 andalso Lv=< 222->901610;
get(Lv,1) when Lv >= 223 andalso Lv=< 252->901701;
get(Lv,2) when Lv >= 223 andalso Lv=< 252->901702;
get(Lv,3) when Lv >= 223 andalso Lv=< 252->901703;
get(Lv,4) when Lv >= 223 andalso Lv=< 252->901704;
get(Lv,5) when Lv >= 223 andalso Lv=< 252->901705;
get(Lv,6) when Lv >= 223 andalso Lv=< 252->901706;
get(Lv,7) when Lv >= 223 andalso Lv=< 252->901707;
get(Lv,8) when Lv >= 223 andalso Lv=< 252->901708;
get(Lv,9) when Lv >= 223 andalso Lv=< 252->901709;
get(Lv,10) when Lv >= 223 andalso Lv=< 252->901710;
get(Lv,1) when Lv >= 253 andalso Lv=< 282->901801;
get(Lv,2) when Lv >= 253 andalso Lv=< 282->901802;
get(Lv,3) when Lv >= 253 andalso Lv=< 282->901803;
get(Lv,4) when Lv >= 253 andalso Lv=< 282->901804;
get(Lv,5) when Lv >= 253 andalso Lv=< 282->901805;
get(Lv,6) when Lv >= 253 andalso Lv=< 282->901806;
get(Lv,7) when Lv >= 253 andalso Lv=< 282->901807;
get(Lv,8) when Lv >= 253 andalso Lv=< 282->901808;
get(Lv,9) when Lv >= 253 andalso Lv=< 282->901809;
get(Lv,10) when Lv >= 253 andalso Lv=< 282->901810;
get(Lv,1) when Lv >= 283 andalso Lv=< 312->901901;
get(Lv,2) when Lv >= 283 andalso Lv=< 312->901902;
get(Lv,3) when Lv >= 283 andalso Lv=< 312->901903;
get(Lv,4) when Lv >= 283 andalso Lv=< 312->901904;
get(Lv,5) when Lv >= 283 andalso Lv=< 312->901905;
get(Lv,6) when Lv >= 283 andalso Lv=< 312->901906;
get(Lv,7) when Lv >= 283 andalso Lv=< 312->901907;
get(Lv,8) when Lv >= 283 andalso Lv=< 312->901908;
get(Lv,9) when Lv >= 283 andalso Lv=< 312->901909;
get(Lv,10) when Lv >= 283 andalso Lv=< 312->901910;
get(Lv,1) when Lv >= 313 andalso Lv=< 342->902001;
get(Lv,2) when Lv >= 313 andalso Lv=< 342->902002;
get(Lv,3) when Lv >= 313 andalso Lv=< 342->902003;
get(Lv,4) when Lv >= 313 andalso Lv=< 342->902004;
get(Lv,5) when Lv >= 313 andalso Lv=< 342->902005;
get(Lv,6) when Lv >= 313 andalso Lv=< 342->902006;
get(Lv,7) when Lv >= 313 andalso Lv=< 342->902007;
get(Lv,8) when Lv >= 313 andalso Lv=< 342->902008;
get(Lv,9) when Lv >= 313 andalso Lv=< 342->902009;
get(Lv,10) when Lv >= 313 andalso Lv=< 342->902010;
get(Lv,1) when Lv >= 343 andalso Lv=< 362->902101;
get(Lv,2) when Lv >= 343 andalso Lv=< 362->902102;
get(Lv,3) when Lv >= 343 andalso Lv=< 362->902103;
get(Lv,4) when Lv >= 343 andalso Lv=< 362->902104;
get(Lv,5) when Lv >= 343 andalso Lv=< 362->902105;
get(Lv,6) when Lv >= 343 andalso Lv=< 362->902106;
get(Lv,7) when Lv >= 343 andalso Lv=< 362->902107;
get(Lv,8) when Lv >= 343 andalso Lv=< 362->902108;
get(Lv,9) when Lv >= 343 andalso Lv=< 362->902109;
get(Lv,10) when Lv >= 343 andalso Lv=< 362->902110;
get(_,_) -> 0.
