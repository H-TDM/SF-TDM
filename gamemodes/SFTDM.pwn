// #v0.0.1#
// San Fierro: Team Deathmatch GameMode
// by Frondor

#include <a_samp>

static gTeam[MAX_PLAYERS];

//Color Defines
#define COLOR_GREY 0x70707096
#define COLOR_DARKGREY 0x545454FF
#define COLOR_GREEN 0x00620096
#define COLOR_RED 0xAA3333AA
#define COLOR_YELLOW 0xFFFF00AA
#define COLOR_DARKRED 0xC50000FF
#define COLOR_DARKYELLOW 0xE5E52BFF
#define COLOR_PINK 0xFF66FFAA
#define COLOR_BLUE 0x0000BBAA
#define COLOR_LIGHTBLUE 0x33CCFFAA
#define COLOR_ORANGE 0xFF9900AA
#define COLOR_BEGE 0xFFA97FFF
#define COLOR_BROWN 0x804000FF
#define COLOR_DARKGREEN 0x007500FF
#define COLOR_LRED 0xFF1111FF
#define COLOR_PURPLE 0xFF80FF00

//Team Defines

#define MAX_TEAMS 14

#define TEAM_WORKER 0
#define TEAM_PIMP 1
#define TEAM_GOLFER 2
#define TEAM_TRIAD 3
#define TEAM_MECHANIC 4
#define TEAM_BIKER 5
#define TEAM_MEDIC 6
#define TEAM_SWAT 7
#define TEAM_HICK 8
#define TEAM_PILOT 9
#define TEAM_TORENO 10
#define TEAM_NANG 11
#define TEAM_CHICKEN 12
#define TEAM_ARMY 13

//Gamemode Text
#define gmTXT "San Fierro: TDM v0.0.1"

//MAX PICKUPS PER WEAPON... 6 is ok
new DropLimit = 6;
//DELETE PICKUPS IN ... SECONDS
new DeleteTime = 60;

//spawninfo defines
new Text:worker0;
new Text:worker1;
new Text:triad0;
new Text:triad1;
new Text:hick0;
new Text:hick1;
new Text:swat0;
new Text:swat1;
new Text:army0;
new Text:army1;
new Text:medic0;
new Text:medic1;
new Text:chicken0;
new Text:chicken1;
new Text:pimp0;
new Text:pimp1;
new Text:mechanic0;
new Text:mechanic1;
new Text:rich0;
new Text:rich1;
new Text:pilot0;
new Text:pilot1;
new Text:biker0;
new Text:biker1;
new Text:nang0;
new Text:nang1;
new Text:golfer0;
new Text:golfer1;
//rules
new Text:rules0;
new Text:rules1;
new Text:rules2;
new Text:Textdraw0;


// forward declarations for the PAWN compiler (not really needed, but there for the sake of clarity)
forward SetPlayerToTeamColor(playerid);
forward SetupPlayerForClassSelection(playerid);
forward SetPlayerTeamFromClass(playerid,classid);

forward DropPlayerWeapons(playerid);
forward DeletePickup(pickupid);

//---------------------------------------------------------

main()
{
	print("\n----------------------------------");
	print(" Blank Gamemode by your name here");
	print("----------------------------------\n");
}


//---------------------------------------------------------

public SetupPlayerForClassSelection(playerid)
{
	// Set the player's orientation when they're selecting a class.
	SetPlayerPos(playerid,1984.4445,157.9501,55.9384);
    SetPlayerCameraPos(playerid,1984.4445,160.9501,55.9384);
	SetPlayerCameraLookAt(playerid,1984.4445,157.9501,55.9384);
	SetPlayerFacingAngle(playerid,0.0);
}

//---------------------------------------------------------

public SetPlayerTeamFromClass(playerid,classid)
{
	if(classid == 0) {

		SetPlayerTeam(playerid,TEAM_WORKER);
	    gTeam[playerid] = TEAM_WORKER;

	} else if(classid == 1) {

		SetPlayerTeam(playerid,TEAM_PIMP);
	    gTeam[playerid] = TEAM_PIMP;

	} else if(classid == 2) {

		SetPlayerTeam(playerid,TEAM_GOLFER);
	    gTeam[playerid] = TEAM_GOLFER;

	} else if(classid == 3) {

		SetPlayerTeam(playerid,TEAM_TRIAD);
	    gTeam[playerid] = TEAM_TRIAD;

	} else if(classid == 4) {

		SetPlayerTeam(playerid,TEAM_MECHANIC);
	    gTeam[playerid] = TEAM_MECHANIC;

	} else if(classid == 5) {

 		SetPlayerTeam(playerid,TEAM_BIKER);
	    gTeam[playerid] = TEAM_BIKER;

	} else if(classid == 6) {

 		SetPlayerTeam(playerid,TEAM_MEDIC);
	    gTeam[playerid] = TEAM_MEDIC;

 	} else if(classid == 7) {

 		SetPlayerTeam(playerid,TEAM_SWAT);
	    gTeam[playerid] = TEAM_SWAT;

 	} else if(classid == 8) {

 		SetPlayerTeam(playerid,TEAM_HICK);
	    gTeam[playerid] = TEAM_HICK;

 	} else if(classid == 9) {

 		SetPlayerTeam(playerid,TEAM_PILOT);
	    gTeam[playerid] = TEAM_PILOT;

 	} else if(classid == 10) {

 		SetPlayerTeam(playerid,TEAM_TORENO);
	    gTeam[playerid] = TEAM_TORENO;

 	} else if(classid == 11) {

 		SetPlayerTeam(playerid,TEAM_NANG);
	    gTeam[playerid] = TEAM_NANG;

 	} else if(classid == 12) {

 		SetPlayerTeam(playerid,TEAM_CHICKEN);
	    gTeam[playerid] = TEAM_CHICKEN;

 	} else if(classid == 13) {

 		SetPlayerTeam(playerid,TEAM_ARMY);
	    gTeam[playerid] = TEAM_ARMY;

	}
}

//---------------------------------------------------------

public SetPlayerToTeamColor(playerid)
{
	if(gTeam[playerid] == TEAM_WORKER)
	{
	    //GivePlayerWeapon(playerid, 16, 8);
		SetPlayerColor(playerid,COLOR_ORANGE); // Orange
	}
	else if(gTeam[playerid] == TEAM_PIMP)
	{
	    //GivePlayerWeapon(playerid, 15, 1);
		SetPlayerColor(playerid,COLOR_DARKRED); // Red
	}
	else if(gTeam[playerid] == TEAM_GOLFER)
	{
	    //GivePlayerWeapon(playerid, 45, 1);
		SetPlayerColor(playerid,COLOR_YELLOW); // Yellow
	}
	else if(gTeam[playerid] == TEAM_TRIAD)
	{
	    //GivePlayerWeapon(playerid, 8, 1);
		SetPlayerColor(playerid,COLOR_PINK); // Pink
	}
	else if(gTeam[playerid] == TEAM_MECHANIC)
	{
	    //GivePlayerWeapon(playerid, 24, 40);
		SetPlayerColor(playerid,COLOR_LIGHTBLUE); // LightBlue
	}
    else if(gTeam[playerid] == TEAM_BIKER)
	{
	    //GivePlayerWeapon(playerid, 24, 40);
		SetPlayerColor(playerid,COLOR_BLUE); // Blue
	}
	else if(gTeam[playerid] == TEAM_MEDIC)
	{
	    //GivePlayerWeapon(playerid, 4, 1);
		SetPlayerColor(playerid,COLOR_PURPLE); // Purple
	}
	else if(gTeam[playerid] == TEAM_SWAT)
	{
	    //GivePlayerWeapon(playerid, 44, 1);
		SetPlayerColor(playerid,COLOR_DARKGREEN); // DarkGreen
	}
	else if(gTeam[playerid] == TEAM_HICK)
	{
	    //GivePlayerWeapon(playerid, 6, 1);
		SetPlayerColor(playerid,COLOR_BROWN); // Brown
    }
	else if(gTeam[playerid] == TEAM_PILOT)
	{
	    //GivePlayerWeapon(playerid, 46, 1);
		SetPlayerColor(playerid,COLOR_DARKGREY); // Grey good
    }
    else if(gTeam[playerid] == TEAM_TORENO)
	{
	    //GivePlayerWeapon(playerid, 16, 8);
		SetPlayerColor(playerid,COLOR_BEGE); // Bege
	}
	else if(gTeam[playerid] == TEAM_NANG)
	{
	    //GivePlayerWeapon(playerid, 16, 8);
	    SetPlayerColor(playerid,COLOR_RED); // lRed
    }
	else if(gTeam[playerid] == TEAM_CHICKEN)
	{
	    //GivePlayerWeapon(playerid, 18, 8);
		SetPlayerColor(playerid,COLOR_DARKYELLOW); // DarkYellow
    }
	else if(gTeam[playerid] == TEAM_ARMY)
	{
	    //GivePlayerWeapon(playerid, 16, 8);
		SetPlayerColor(playerid,COLOR_DARKGREEN); // DarkGreen
	}

}

//---------------------------------------------------------

public OnGameModeInit()
{

	SetGameModeText(gmTXT);

    UsePlayerPedAnims();
	SetTeamCount(MAX_TEAMS);
	ShowNameTags(1);
	ShowPlayerMarkers(1);

    //SetDisabledWeapons(44,45,38,35,36);//44=nightvision, 45=thermal, 38=minigun, 35-36=rocket

	AddPlayerClass(260,-2062.5583,237.4662,35.7149,268.8936,30,150,25,50,29,150); //Worker
	AddPlayerClass(249,-2653.6443,1388.2767,7.1301,212.8453,26,100,29,150,16,8); //Pimp
	AddPlayerClass(259,-2642.2583,-274.9985,7.5393,135.0036,34,18,32,150,2,1); //Golfer
	AddPlayerClass(118,-2182.8789,609.0111,35.1641,90.3134,30,150,32,150,24,50); //Triad
	AddPlayerClass(50,-540.9334,-493.9939,25.5234,2.1357,26,100,30,150,16,8); //Mechanic
    AddPlayerClass(248,-590.2386,-1070.6687,23.4799,245.1315,29,150,16,8,25,50); //Biker
	AddPlayerClass(274,-2665.4282,635.6348,14.4531,179.8403,33,30,29,150,23,30); //Medic
    AddPlayerClass(285,-1635.0077,665.8105,7.1875,264.2244,29,150,31,150,16,8); //Swat
	AddPlayerClass(162,-530.9717,-98.2034,63.2969,4.3698,26,100,28,150,24,20); //Hick
	AddPlayerClass(255,-1331.1147,-235.3819,858.4656,106.3832,34,18,23,30,18,8); //Pilot
    AddPlayerClass(187,-2664.8774,940.8234,79.7101,184.9922,31,150,27,100,16,8); //Toreno
    AddPlayerClass(122,-1478.7167,1489.1571,8.2501,272.8738,27,100,28,150,24,50); // nang
    AddPlayerClass(167,-2671.8293,267.5992,4.3359,358.9251,26,100,29,150,24,20); // chicken
    AddPlayerClass(287,-1335.4381,506.1993,11.1953,83.7755,31,150,24,20,27,100); // army

	CreateVehicle(471,-1331.0846,-232.7304,858.1304,106.1061,0,7,120); // quad1
	CreateVehicle(471,-1333.1228,-233.3187,857.6396,106.1063,0,7,120); // quad2
	CreateVehicle(471,-1334.9735,-233.8529,857.1973,106.0828,0,7,120); // qaud3
	CreateVehicle(471,-1336.8336,-234.3891,856.7507,106.0772,0,7,120); // qaud4
	CreateVehicle(471,-1338.6772,-234.9201,856.3088,106.0686,0,7,120); // qaud5
	CreateVehicle(471,-1329.3984,-238.3599,858.1602,104.6697,0,7,120); // quad6
	CreateVehicle(471,-1331.0671,-238.7967,857.7630,104.6650,0,7,120); // quad7
	CreateVehicle(471,-1332.7803,-239.2450,857.3539,104.6976,0,7,120); // quad8
	CreateVehicle(471,-1334.5336,-239.7271,856.9307,106.4921,0,7,120); // quad9
	CreateVehicle(471,-1336.1462,-240.2041,856.5461,106.4772,0,7,120); // quad10
	CreateVehicle(519,-1289.7424,-350.5048,15.1024,195.3063,0,7,120); // shamal1
	CreateVehicle(519,-1311.3673,-355.8325,15.0744,194.4418,0,7,120); // shamal2
	CreateVehicle(476,-1266.8002,-341.9807,14.8562,202.8707,0,7,120); // rustler1
	CreateVehicle(463,-588.1334,-1075.4253,22.9613,235.9492,0,7,120); // freeway1
	CreateVehicle(463,-586.3122,-1072.1973,22.9270,234.7390,0,7,120); // freeway2
	CreateVehicle(463,-584.4375,-1069.1838,22.8900,234.7676,0,7,120); // freeway3
	CreateVehicle(463,-581.8464,-1066.4482,22.9467,235.5516,0,7,120); // freeway4
	CreateVehicle(463,-580.2595,-1063.2745,23.0204,234.4455,0,7,120); // freeway5
	CreateVehicle(463,-578.2027,-1060.0898,23.1023,234.5559,0,7,120); // freeway6
	CreateVehicle(463,-576.0919,-1057.0671,23.1828,233.2619,0,7,120); // freeway7
	CreateVehicle(463,-574.0414,-1054.0868,23.2618,234.4510,0,7,120); // freeway8
	CreateVehicle(463,-572.5219,-1050.8461,23.3353,234.0683,0,7,120); // freeway
	CreateVehicle(463,-570.2981,-1047.8882,23.4104,234.5488,0,7,120); // freeway10
	CreateVehicle(520,-1586.9945,-288.4680,14.8716,47.7482,0,7,120); // hydra1
	CreateVehicle(520,-1595.4969,-298.8236,14.8716,52.5507,0,7,120); // hydra2
	CreateVehicle(519,-1440.1042,-525.9028,15.0938,205.9727,0,7,120); // shamalhangar
	CreateVehicle(519,-1361.4075,-493.6789,15.0908,206.8716,0,7,120); // shamalhangar1
	CreateVehicle(592,-1603.1377,-500.5093,23.2879,44.3925,0,7,120); // andromedabrug
	CreateVehicle(577,-1684.7770,-190.2014,14.0623,314.7069,0,0,120); // at400hydra
	CreateVehicle(556,-374.5188,-792.5562,30.8738,240.0383,0,7,120); // monstertruck
	CreateVehicle(520,706.6594,-2261.2424,13.5735,274.6305,0,7,120); // hydraadmin1
	CreateVehicle(520,705.5833,-2249.1421,13.5735,282.7750,0,7,120); // hydraadmin2
	CreateVehicle(497,-1681.3857,705.7542,30.7787,268.3755,1,1,120); // policeswatheli
	CreateVehicle(427,-1605.8827,673.2131,7.3195,179.9547,0,1,120); // enforcerswat1
	CreateVehicle(427,-1594.0354,673.1947,7.3191,180.0891,0,1,120); // enforcerswat2
	CreateVehicle(597,-1599.9773,673.2905,6.9573,180.4921,0,1,120); // sfpd1
	CreateVehicle(601,-1588.1655,673.2490,6.9463,180.3133,1,1,120); // swatwater1
	CreateVehicle(601,-1581.6047,651.1897,6.9463,0.5391,1,1,120); // swatwater2
	CreateVehicle(427,-1587.9159,652.1567,7.3194,359.6385,0,1,120); // enforcerswat
	CreateVehicle(597,-1593.7037,652.1074,6.9557,0.6342,0,1,120); // sfpd
	CreateVehicle(597,-1599.5651,652.1554,6.9564,359.5761,0,1,120); // sfpd
	CreateVehicle(597,-1610.7178,652.1724,6.9576,357.6054,0,1,120); // sfpd
	CreateVehicle(427,-1616.4803,651.7550,7.3192,0.2895,0,1,120); // enforcerswat
	CreateVehicle(593,-1283.2323,-259.4105,14.5798,26.5470,60,1,120); // dodo1
	CreateVehicle(593,-1325.9102,-279.6250,14.6085,26.3195,58,8,120); // dodo2
	CreateVehicle(593,-1312.5881,-273.3793,14.6102,24.4373,2,1,120); // dodo4
	CreateVehicle(476,-1297.6835,-267.1807,14.8538,24.6283,7,6,120); // rustler1
	CreateVehicle(593,-1390.2306,-215.9052,14.6066,243.2827,68,8,120); // dodo5
	CreateVehicle(593,-1382.8989,-199.9279,14.6058,244.6571,13,8,120); // dodo6
	CreateVehicle(513,-1271.8248,-254.2045,14.6964,25.8020,0,7,120); // stuntplane
	CreateVehicle(476,-1376.3331,-183.9525,14.8587,244.2562,1,6,120); // rustler
	CreateVehicle(511,-1124.1268,-215.5061,15.5241,103.6089,8,66,120); // beagle
	CreateVehicle(511,-1131.9965,-191.5900,15.5180,109.1899,0,7,120); // beagle
	CreateVehicle(417,-1223.6155,-11.2785,14.2421,43.9280,0,7,120); // levathian heli
	CreateVehicle(417,-1185.4189,24.8705,14.2279,44.7164,0,0,120); // levathian ap 2
	CreateVehicle(485,-1175.7916,-148.4632,13.8019,136.6563,1,74,120); // baggagecar-ap
	CreateVehicle(433,-1453.4021,459.5739,7.6209,0.0983,43,0,120); // barrack
	CreateVehicle(433,-1447.2100,459.6718,7.6222,0.7908,43,0,120); // barrack
	CreateVehicle(470,-1441.2654,461.2669,7.1746,0.1664,43,0,120); // patriot
	CreateVehicle(470,-1435.7161,461.3101,7.1741,2.2390,43,0,120); // patriot
	CreateVehicle(470,-1459.3347,461.3413,7.1724,0.5497,43,0,120); // patriot
	CreateVehicle(470,-1475.2953,461.0638,7.1701,358.1463,43,0,120); // patriot
	CreateVehicle(548,-1459.7053,501.1780,19.9128,90.4667,0,7,120); // cargobob schip
	CreateVehicle(430,-1453.2120,493.0416,-0.2642,89.9948,0,7,120); // predator schip
	CreateVehicle(430,-1449.8503,509.2277,-0.4126,88.6226,46,26,120); // predator schip
	CreateVehicle(409,-2618.0696,1349.3864,6.9744,180.0236,1,1,120); // stretcher
	CreateVehicle(439,-2087.2488,254.1511,35.8860,182.2311,0,7,120); // stallion workers
	CreateVehicle(455,-2072.5313,255.8437,36.0024,180.7321,84,58,120); // flatbed workers
	CreateVehicle(541,-2033.2311,170.2635,28.4609,272.0341,58,8,120); // bullet workers
	CreateVehicle(451,-1949.8311,258.7238,35.1766,67.1317,16,16,120); // turismo showroom workers
	CreateVehicle(522,-1950.2866,273.5888,40.6224,90.0485,3,3,120); // nrg showroom workers
	CreateVehicle(477,-1954.6924,303.0300,35.2243,143.7713,0,7,120); // sportwagen showroom workers
	CreateVehicle(471,-1732.1516,594.3750,24.3583,1.1434,74,91,120); // quad
	CreateVehicle(507,-1629.5237,872.6083,8.2645,180.6872,0,7,120); // elegant
	CreateVehicle(522,-1661.5031,1207.4307,20.7293,306.4218,3,8,120); // nrg showroom
	CreateVehicle(506,-1658.9474,1212.4692,6.9546,291.5670,0,7,120); // supergt showroom
	CreateVehicle(603,-1661.9515,1213.7438,13.5104,295.7164,0,7,120); // phoenix showroom
	CreateVehicle(446,-1572.1675,1263.2318,-0.4548,271.1535,3,3,120); // squalo pier 69
	CreateVehicle(473,-1446.9709,1506.0396,-0.4551,274.4062,56,53,120); // dinghy nang
	CreateVehicle(446,-1456.0205,1464.7013,-1.0466,183.4196,1,22,120); // squalo nang
	CreateVehicle(446,-1439.7700,1465.2950,-0.8570,178.5492,1,35,120); // squalo2 nang
	CreateVehicle(493,-1424.1104,1464.4220,0.2635,180.0312,0,7,120); // jetmax nang
	CreateVehicle(460,-1392.3185,1524.1824,1.3338,353.0948,1,9,120); // skimmer nang1
	CreateVehicle(453,-1382.1621,1520.8270,-0.7090,331.1713,0,7,120); // reefer nang
	CreateVehicle(515,-484.3663,-473.5274,26.5414,178.2755,24,77,120); // roadtrain mech
	CreateVehicle(515,-479.2825,-473.5772,26.5403,179.5269,54,77,120); // roadtrain mech1
	CreateVehicle(524,-2063.3633,229.2307,36.6795,2.4409,0,7,120); // cementworkers
	CreateVehicle(601,-1574.1744,726.4121,-5.4834,89.7060,0,7,120); // SWAT garage
	CreateVehicle(412,-1784.1588,715.8806,34.7033,358.3048,0,7,120); // voodo city
	CreateVehicle(422,-1914.5186,792.3923,39.7259,266.6577,0,7,120); // bobcat city
	CreateVehicle(424,-2915.4692,411.2508,3.7899,104.1431,0,7,120); // beachcar
	CreateVehicle(460,-2953.7786,499.2873,1.8422,0.8239,1,18,120); // skimmer chicken
	CreateVehicle(429,-2875.6758,793.5854,35.4228,263.6978,14,14,120); // banshee
	CreateVehicle(451,-2660.7803,885.7050,79.4807,0.6360,36,36,120); // turismo torenos
	CreateVehicle(429,-2664.9697,912.9534,79.3542,181.6790,1,2,120); // banshee torenos
	CreateVehicle(522,-2669.8237,893.5916,79.1174,285.0875,7,79,120); // nrg torenos
	CreateVehicle(595,-1500.0380,1390.4011,0.1715,292.7947,0,7,120); // launch nang
	CreateVehicle(424,-364.5125,-1409.9636,25.5088,92.9053,2,2,120); // bf farmers
	CreateVehicle(555,-378.9482,-1454.7550,25.4099,356.7096,0,7,120); // windsor farmers
	CreateVehicle(447,-1466.7335,-153.8585,6.0169,4.9886,0,7,120); // secret seasparrow
	CreateVehicle(487,-1290.2253,-17.9604,14.3259,132.8653,29,42,120); // maverick ap
	CreateVehicle(487,-1304.6489,-3.2582,14.3246,134.1127,26,57,120); // maverik ap
	CreateVehicle(421,-1943.1354,161.0854,27.0362,356.3368,13,1,120); // washington train workers
	CreateVehicle(537,-1942.2499,177.6045,27.2245,356.4843,1,1,120); // train workers
	CreateVehicle(480,-524.2804,-471.3609,25.2977,178.4148,2,2,120); // comet
	CreateVehicle(480,-529.5109,-471.6548,25.2953,176.6715,12,12,120); // comet
	CreateVehicle(424,-519.4714,-471.3319,25.3041,176.5628,2,2,120); // bf mech
	CreateVehicle(412,-559.5734,-473.0458,25.3588,179.5488,11,1,120); // voodo mech
	CreateVehicle(422,-560.0017,-488.1627,25.5089,359.9904,101,25,120); // bobcat mech
	CreateVehicle(542,-542.7549,-99.3194,63.1745,357.8329,24,118,120); // clover hick
	CreateVehicle(468,-536.0410,-77.7962,62.5291,269.1149,46,46,120); // sanchez hick
	CreateVehicle(555,-539.9163,-74.2539,62.5439,270.4185,58,1,120); // windsor hick
	CreateVehicle(531,-526.5109,-102.4536,63.2589,267.8327,36,2,120); // tractor hick
	CreateVehicle(478,-551.0283,-77.5382,63.1451,180.9080,66,1,120); // walton
	CreateVehicle(471,-500.4510,-69.9420,61.0480,115.8333,120,112,120); // quad hick
	CreateVehicle(468,-533.0751,-98.3595,62.9655,326.2289,53,53,120); // sanchez hick
	CreateVehicle(422,-956.1768,-224.3703,40.0620,129.4595,111,31,120); // bobcat
	CreateVehicle(468,-917.0044,-524.4356,25.6224,116.3784,3,3,120); // sancehz camping
	CreateVehicle(424,-1124.3544,-555.4586,30.4514,70.3185,3,2,120); // injection weg vliegveld
	CreateVehicle(478,-1162.9553,-586.7974,34.6831,172.5060,59,1,120); // walton weg ap
	CreateVehicle(533,-1184.4913,-670.3323,47.8833,172.2101,74,1,120); // feltzer weg ap
	CreateVehicle(518,-1652.1440,-563.9786,13.8196,312.8725,9,39,120); // buccaneer ap
	CreateVehicle(522,-2267.5876,204.3293,34.7205,87.8311,36,105,120); // nrg
	CreateVehicle(451,-2266.2581,192.6582,34.8702,90.1014,36,36,120); // turismo city
	CreateVehicle(434,-2685.0981,268.1706,4.3045,359.9309,12,12,120); // hotknife chicken
	CreateVehicle(603,-2678.3521,268.4741,4.1741,0.5581,75,77,120); // phoenix chicken
	CreateVehicle(522,-2664.8284,268.8790,3.9084,356.9640,39,106,120); // nrg chicken
	CreateVehicle(471,-2697.6968,277.3120,3.8046,359.3735,74,83,120); // quad chicken
	CreateVehicle(575,-2617.6062,1370.0277,6.6775,178.9059,19,96,120); // broadway pimp
	CreateVehicle(545,-2622.5396,1349.1959,6.9676,181.5360,47,1,120); // hustler
	CreateVehicle(467,-2622.1089,1370.8529,6.8204,180.4827,58,8,120); // oceanic pimp
	CreateVehicle(541,-2626.4973,1371.4775,6.7170,178.4769,60,1,120); // bullet pimp
	CreateVehicle(409,-2607.1426,1365.7740,6.9326,267.3618,1,1,120); // stretcher
	CreateVehicle(429,-2626.6687,1349.0995,6.8149,358.6410,13,13,120); // banshee pimp
	CreateVehicle(447,-1313.7881,1488.2650,0.6646,352.2195,75,2,120); // seasparrow nang
	CreateVehicle(541,-2674.1563,892.1849,79.2515,282.5140,68,8,120); // bullet troreno
	CreateVehicle(545,-2019.7070,432.7517,34.9827,268.8799,44,96,120); // hustler city workers
	CreateVehicle(459,-1539.2094,1012.3886,7.2382,123.5332,28,28,120); // van city
	CreateVehicle(541,-1797.1143,1312.0325,59.3594,176.6748,68,8,120); // bullet garage
	CreateVehicle(429,-1810.4651,1311.1039,59.4141,187.0934,2,1,120); // banshee garage
	CreateVehicle(480,-1816.3813,1310.8966,59.5092,186.4798,6,6,120); // comet garage
	CreateVehicle(522,-1802.8806,1312.6412,59.2954,180.7814,39,106,120); // nrg garage
	CreateVehicle(522,-2137.9922,1251.8378,22.6064,354.9411,39,106,120); // nrg city
	CreateVehicle(405,-2178.0479,1251.9452,29.7961,359.2146,24,1,120); // sentinel city
	CreateVehicle(411,-2284.1589,1101.8370,79.8259,273.1972,64,1,120); // infernus city
	CreateVehicle(410,-2213.2407,1104.7272,79.6655,179.3469,9,1,120); // manana city
	CreateVehicle(522,-2127.5107,650.8709,51.9389,89.0601,51,118,120); // nrg triads
	CreateVehicle(462,-2212.7847,612.6624,34.7604,177.0334,13,13,120); // faggio triad
	CreateVehicle(585,-2228.8389,572.9700,34.6790,270.6666,42,42,120); // emperor triads
	CreateVehicle(587,-2285.3010,580.3007,34.8914,271.7863,40,1,120); // euros city triad
	CreateVehicle(507,-2271.6318,545.0032,34.8415,272.7581,53,53,120); // elegant city traids
	CreateVehicle(416,-2570.7822,622.0333,14.6006,267.3199,1,3,120); // ambulance medic
	CreateVehicle(416,-2570.7798,638.4097,14.6082,273.1752,1,3,120); // ambulance medic
	CreateVehicle(561,-2545.4460,632.8561,14.2671,89.1344,43,21,120); // stratum medic
	CreateVehicle(416,-2646.1672,613.5593,14.6024,178.5010,1,3,120); // amublance medic
	CreateVehicle(516,-2671.1431,613.2625,14.2885,178.3544,119,1,120); // nebula medic
	CreateVehicle(489,-2653.1895,583.9393,14.5955,89.5334,14,123,120); // rancher medic
	CreateVehicle(480,-2872.7922,727.6775,29.1738,278.1286,46,46,120); // comet city
	CreateVehicle(603,-2404.9995,942.4192,45.2247,269.5974,18,1,120); // phoenix city
	CreateVehicle(442,-2572.2646,1147.5435,55.5530,157.3655,11,105,120); // romero city
	CreateVehicle(445,-2379.5295,1231.7673,32.0811,271.6473,35,35,120); // adminiral city
	CreateVehicle(475,-1833.4215,113.0971,14.9194,269.6346,9,39,120); // sabre dock city
	CreateVehicle(522,-1708.6316,977.6370,17.1580,349.0795,6,25,120); // nrg under garage
	CreateVehicle(480,-1687.4658,999.8015,17.3605,89.9063,73,45,120); // comet under garage
	CreateVehicle(451,-1687.5680,1036.5848,17.2912,91.5156,18,18,120); // turismo under garage
	CreateVehicle(429,-1688.0038,983.5756,17.2656,90.3479,1,3,120); // banshee under garage
	CreateVehicle(445,-1703.3503,1012.4879,17.4609,269.3854,37,37,120); // adminiral under garage
	CreateVehicle(475,-1736.8923,1028.7772,17.3912,268.1563,21,1,120); // sabre under gargae
	CreateVehicle(411,-1736.1353,1007.8314,17.3130,269.6040,123,1,120); // internus under garage
	CreateVehicle(522,-1720.1289,1010.7611,17.1334,92.6104,3,8,120); // nrg under gararge
	CreateVehicle(479,-1800.9136,822.4512,24.6873,2.1440,59,36,120); // regina city
	CreateVehicle(483,-1730.5592,751.7266,24.8828,268.6238,1,31,120); // hippie city
	CreateVehicle(499,-2159.3887,454.2749,35.1642,270.0649,109,32,120); // benson city
	CreateVehicle(490,-2175.8828,292.8557,35.2439,359.1608,0,0,120); // fbirancher city
	CreateVehicle(506,-2218.5198,305.8065,34.8217,181.4081,7,7,120); // super gt city
	CreateVehicle(411,-2033.7422,-95.7351,34.8911,356.6624,116,1,120); // infernus city
	CreateVehicle(463,-2021.5338,-100.8840,34.7042,273.7768,11,11,120); // freeway city
	CreateVehicle(457,-2655.8318,-279.1873,7.1280,131.0528,2,1,120); // caddy golfer
	CreateVehicle(457,-2652.2632,-296.2739,7.0983,315.0136,34,1,120); // caddy golfers
	CreateVehicle(457,-2653.6724,-281.4860,7.1300,135.4543,32,1,120); // caddy golers
	CreateVehicle(457,-2657.4885,-277.3954,7.1233,129.5761,18,1,120); // caddy golfers
	CreateVehicle(457,-2661.0266,-287.4526,7.1138,310.9831,63,1,120); // caddy golfers
	CreateVehicle(489,-2676.4258,-276.1584,7.3181,314.3358,120,123,120); // rancher golfers
	CreateVehicle(475,-2674.7202,-251.1950,6.4957,134.3407,33,0,120); // sabre golfers
	CreateVehicle(457,-2478.0408,-303.5780,40.8994,39.6081,58,1,120); // caddy golf terain
	CreateVehicle(527,-2592.8733,-100.8010,4.0241,91.0810,53,1,120); // cadrona city
	CreateVehicle(533,-2718.8149,10.8991,4.0450,269.5640,75,1,120); // feltzer city
	CreateVehicle(543,-2755.4929,171.0767,6.8602,174.0683,32,8,120); // sadler city
	CreateVehicle(444,-2884.8330,160.6096,5.7309,183.4403,32,42,120); // monster beach chicken
	CreateVehicle(411,-2796.2339,223.6504,6.9145,90.7779,112,1,120); // infernus city
	CreateVehicle(409,-2757.9580,376.0507,4.1391,0.4436,1,1,120); // stretcher city
	CreateVehicle(541,-2585.1760,332.3127,4.4764,90.2705,22,1,120); // bullet city
	CreateVehicle(566,-2585.6011,325.1963,4.6342,269.3877,30,8,120); // tahoma city
	CreateVehicle(580,-2586.3020,310.9505,4.6513,91.0530,81,81,120); // stafford city
	CreateVehicle(468,-895.4147,-1155.3451,102.7189,185.4269,6,6,120); // sanchez country
	CreateVehicle(522,-1387.5490,-618.0760,13.7097,61.4423,39,106,120); // nrg vliegveld
	CreateVehicle(476,-1344.7352,-616.6428,14.8596,37.2596,119,117,120); // rustler vliegveld hangar
	CreateVehicle(460,-1372.8444,1516.3047,1.5853,338.4427,1,30,120); // skimmer nang
	CreateVehicle(541,-2578.4207,999.5179,77.8375,89.0168,22,1,120); // bullet toreno
	CreateVehicle(476,-1410.9948,517.0949,18.9493,182.4897,119,117,120); // rustler army ship
	CreateVehicle(476,-1428.5999,507.6015,18.9360,269.5311,103,102,120); // rustler army ship
	CreateVehicle(520,-1820.8499,-1609.9801,23.7388,189.7787,0,0,120); // secret hydra
    CreateVehicle(553,-1187.6145,-165.4155,15.4787,105.1306,55,23,120); // nevada ap
    CreateVehicle(553,-1246.8854,-101.2565,15.4789,135.0078,61,74,120); // nevada ap1
    CreateVehicle(453,-1364.5394,-703.4726,-0.2448,269.0192,56,56,120); // reefer ap
    CreateVehicle(443,-605.2082,-498.4219,26.1568,269.6630,20,1,120); // packer mechanics
    CreateVehicle(542,-599.8732,-560.0121,25.2666,272.3698,31,93,120); // clover mech
    CreateVehicle(468,-767.8223,-630.7264,65.7323,358.6574,46,46,120); // sanchez country
    CreateVehicle(407,-2053.5063,75.4488,28.6258,91.9088,3,1,120); // firetruck fdsa
    CreateVehicle(559,-1707.7039,1348.4867,6.8361,135.6851,60,1,120); // jester
    CreateVehicle(559,-1817.1080,1293.3694,59.3907,5.6484,60,1,120); // Jester

	/*Clock = TextDrawCreate(547.0, 24.0, "12:00");
	TextDrawSetShadow(Clock, 0);
	TextDrawSetOutline(Clock, 2);
	TextDrawLetterSize(Clock, 0.6, 1.8);
	TextDrawFont(Clock, 3);*/

	Textdraw0 = TextDrawCreate(176.000000,390.000000,"Spectating, respawn in 10 seconds");
    TextDrawAlignment(Textdraw0,0);
    TextDrawBackgroundColor(Textdraw0,0x000000ff);
    TextDrawFont(Textdraw0,3);
    TextDrawLetterSize(Textdraw0,0.499999,0.799999);
    TextDrawColor(Textdraw0,0xffffff99);
    TextDrawSetOutline(Textdraw0,1);
    TextDrawSetProportional(Textdraw0,1);
    TextDrawSetShadow(Textdraw0,1);

	rules0 = TextDrawCreate(218.000000,93.000000,"PartyRules");
	rules1 = TextDrawCreate(152.000000,121.000000,"~w~-no cheating or glitching~n~ ~n~-always play as a team~n~ ~n~-respect other players~n~ ~n~-no racism~n~ ~n~-respect the admin");
	rules2 = TextDrawCreate(109.000000,279.000000,"Abusing of these rules may result in a kick or a ban");
	TextDrawAlignment(rules0,0);
	TextDrawAlignment(rules1,0);
	TextDrawAlignment(rules2,0);
	TextDrawBackgroundColor(rules0,0x000000ff);
	TextDrawBackgroundColor(rules1,0x000000ff);
	TextDrawBackgroundColor(rules2,0x000000ff);
	TextDrawFont(rules0,3);
	TextDrawLetterSize(rules0,1.000000,2.200000);
	TextDrawFont(rules1,3);
	TextDrawLetterSize(rules1,0.799999,1.800000);
	TextDrawFont(rules2,1);
	TextDrawLetterSize(rules2,0.499999,1.000000);
	TextDrawColor(rules0,0xff0000cc);
	TextDrawColor(rules1,0xffffffff);
	TextDrawColor(rules2,0xff0000cc);
	TextDrawSetOutline(rules0,1);
	TextDrawSetOutline(rules1,1);
	TextDrawSetOutline(rules2,1);
	TextDrawSetProportional(rules0,1);
	TextDrawSetProportional(rules1,1);
	TextDrawSetProportional(rules2,1);
	TextDrawSetShadow(rules0,1);
	TextDrawSetShadow(rules1,1);
	TextDrawSetShadow(rules2,1);

	worker0 = TextDrawCreate(69.000000,118.000000,"~y~the workers~n~ ~n~~g~alias~n~~w~bikers~n~ ~n~~r~rivals~n~~w~the hicks~n~ ~n~~y~respawn point~n~~w~construction side");
	worker1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~orange~n~ ~n~~y~weapons~n~~w~ak-47~n~shotgun~n~MP5~n~grenades");
	TextDrawAlignment(worker0,0);
	TextDrawAlignment(worker1,0);
	TextDrawBackgroundColor(worker0,0x000000ff);
	TextDrawBackgroundColor(worker1,0x000000ff);
	TextDrawFont(worker0,3);
	TextDrawLetterSize(worker0,0.299999,1.000000);
	TextDrawFont(worker1,3);
	TextDrawLetterSize(worker1,0.399999,1.000000);
	TextDrawColor(worker0,0xffffffff);
	TextDrawColor(worker1,0xffffffff);
	TextDrawSetOutline(worker0,1);
	TextDrawSetOutline(worker1,1);
	TextDrawSetProportional(worker0,1);
	TextDrawSetProportional(worker1,1);
	TextDrawSetShadow(worker0,1);
	TextDrawSetShadow(worker1,1);

	pimp0 = TextDrawCreate(69.000000,118.000000,"~y~The pimps~n~ ~n~~g~alias~n~~w~nang~n~ ~n~~r~rivals~n~~w~Rich~n~ ~n~~y~respawn point~n~~w~jizzy's club");
	pimp1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~red~n~ ~n~~y~weapons~n~~w~sawn-off~n~MP5~n~grenades~n~cane");
	TextDrawAlignment(pimp0,0);
	TextDrawAlignment(pimp1,0);
	TextDrawBackgroundColor(pimp0,0x000000ff);
	TextDrawBackgroundColor(pimp1,0x000000ff);
	TextDrawFont(pimp0,3);
	TextDrawLetterSize(pimp0,0.299999,1.000000);
	TextDrawFont(pimp1,3);
	TextDrawLetterSize(pimp1,0.399999,1.000000);
	TextDrawColor(pimp0,0xffffffff);
	TextDrawColor(pimp1,0xffffffff);
	TextDrawSetOutline(pimp0,1);
	TextDrawSetOutline(pimp1,1);
	TextDrawSetProportional(pimp0,1);
	TextDrawSetProportional(pimp1,1);
	TextDrawSetShadow(pimp0,1);
	TextDrawSetShadow(pimp1,1);

	golfer0 = TextDrawCreate(69.000000,118.000000,"~y~The golfers~n~ ~n~~g~alias~n~~w~rich~n~ ~n~~r~rivals~n~~w~pilots~n~ ~n~~y~respawn point~n~~w~golf course");
	golfer1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~yellow~n~ ~n~~y~weapons~n~~w~sniper~n~tec9~n~golf club~n~nvg goggles");
	TextDrawAlignment(golfer0,0);
	TextDrawAlignment(golfer1,0);
	TextDrawBackgroundColor(golfer0,0x000000ff);
	TextDrawBackgroundColor(golfer1,0x000000ff);
	TextDrawFont(golfer0,3);
	TextDrawLetterSize(golfer0,0.299999,1.000000);
	TextDrawFont(golfer1,3);
	TextDrawLetterSize(golfer1,0.399999,1.000000);
	TextDrawColor(golfer0,0xffffffff);
	TextDrawColor(golfer1,0xffffffff);
	TextDrawSetOutline(golfer0,1);
	TextDrawSetOutline(golfer1,1);
	TextDrawSetProportional(golfer0,1);
	TextDrawSetProportional(golfer1,1);
	TextDrawSetShadow(golfer0,1);
	TextDrawSetShadow(golfer1,1);

	triad0 = TextDrawCreate(69.000000,118.000000,"~y~the triads~n~ ~n~~g~alias~n~~w~chickens~n~ ~n~~r~rivals~n~~w~the nang~n~ ~n~~y~respawn point~n~~w~china town");
	triad1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~dark red~n~ ~n~~y~weapons~n~~w~ak-47~n~TEC9~n~desert eagle~n~katana");
	TextDrawAlignment(triad0,0);
	TextDrawAlignment(triad1,0);
	TextDrawBackgroundColor(triad0,0x000000ff);
	TextDrawBackgroundColor(triad1,0x000000ff);
	TextDrawFont(triad0,3);
	TextDrawLetterSize(triad0,0.299999,1.000000);
	TextDrawFont(triad1,3);
	TextDrawLetterSize(triad1,0.399999,1.000000);
	TextDrawColor(triad0,0xffffffff);
	TextDrawColor(triad1,0xffffffff);
	TextDrawSetOutline(triad0,1);
	TextDrawSetOutline(triad1,1);
	TextDrawSetProportional(triad0,1);
	TextDrawSetProportional(triad1,1);
	TextDrawSetShadow(triad0,1);
	TextDrawSetShadow(triad1,1);

	mechanic0 = TextDrawCreate(69.000000,118.000000,"~y~The mechanics~n~ ~n~~g~alias~n~~w~none~n~ ~n~~r~rivals~n~~w~bikers~n~ ~n~~y~respawn point~n~~w~repair shop");
	mechanic1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~light blue~n~ ~n~~y~weapons~n~~w~sawn-off~n~ak-47~n~desert eagle~n~grenades");
	TextDrawAlignment(mechanic0,0);
	TextDrawAlignment(mechanic1,0);
	TextDrawBackgroundColor(mechanic0,0x000000ff);
	TextDrawBackgroundColor(mechanic1,0x000000ff);
	TextDrawFont(mechanic0,3);
	TextDrawLetterSize(mechanic0,0.299999,1.000000);
	TextDrawFont(mechanic1,3);
	TextDrawLetterSize(mechanic1,0.399999,1.000000);
	TextDrawColor(mechanic0,0xffffffff);
	TextDrawColor(mechanic1,0xffffffff);
	TextDrawSetOutline(mechanic0,1);
	TextDrawSetOutline(mechanic1,1);
	TextDrawSetProportional(mechanic0,1);
	TextDrawSetProportional(mechanic1,1);
	TextDrawSetShadow(mechanic0,1);
	TextDrawSetShadow(mechanic1,1);

	biker0 = TextDrawCreate(69.000000,118.000000,"~y~The bikers~n~ ~n~~g~alias~n~~w~workers~n~ ~n~~r~rivals~n~~w~mechanics~n~ ~n~~y~respawn point~n~~w~drive-in motel");
	biker1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~dark blue~n~ ~n~~y~weapons~n~~w~MP5~n~desert eagle~n~shotgun~n~grenades");
	TextDrawAlignment(biker0,0);
	TextDrawAlignment(biker1,0);
	TextDrawBackgroundColor(biker0,0x000000ff);
	TextDrawBackgroundColor(biker1,0x000000ff);
	TextDrawFont(biker0,3);
	TextDrawLetterSize(biker0,0.299999,1.000000);
	TextDrawFont(biker1,3);
	TextDrawLetterSize(biker1,0.399999,1.000000);
	TextDrawColor(biker0,0xffffffff);
	TextDrawColor(biker1,0xffffffff);
	TextDrawSetOutline(biker0,1);
	TextDrawSetOutline(biker1,1);
	TextDrawSetProportional(biker0,1);
	TextDrawSetProportional(biker1,1);
	TextDrawSetShadow(biker0,1);
	TextDrawSetShadow(biker1,1);

	medic0 = TextDrawCreate(69.000000,118.000000,"~y~The medics~n~ ~n~~g~alias~n~~w~NONE~n~ ~n~~r~rivals~n~~w~NONE~n~ ~n~~y~respawn point~n~~w~hospital");
	medic1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~purple~n~ ~n~~y~weapons~n~~w~rifle~n~MP5~n~silenced 45mm~n~knife");
	TextDrawAlignment(medic0,0);
	TextDrawAlignment(medic1,0);
	TextDrawBackgroundColor(medic0,0x000000ff);
	TextDrawBackgroundColor(medic1,0x000000ff);
	TextDrawFont(medic0,3);
	TextDrawLetterSize(medic0,0.299999,1.000000);
	TextDrawFont(medic1,3);
	TextDrawLetterSize(medic1,0.399999,1.000000);
	TextDrawColor(medic0,0xffffffff);
	TextDrawColor(medic1,0xffffffff);
	TextDrawSetOutline(medic0,1);
	TextDrawSetOutline(medic1,1);
	TextDrawSetProportional(medic0,1);
	TextDrawSetProportional(medic1,1);
	TextDrawSetShadow(medic0,1);
	TextDrawSetShadow(medic1,1);

	swat0 = TextDrawCreate(69.000000,118.000000,"~y~S.W.A.T/justice~n~ ~n~~g~alias~n~~w~army~n~ ~n~~r~rivals~n~~w~chickens~n~ ~n~~y~respawn point~n~~w~sfpd");
	swat1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~dark green~n~ ~n~~y~weapons~n~~w~mp5~n~m4~n~grenades~n~nv goggles");
	TextDrawAlignment(swat0,0);
	TextDrawAlignment(swat1,0);
	TextDrawBackgroundColor(swat0,0x000000ff);
	TextDrawBackgroundColor(swat1,0x000000ff);
	TextDrawFont(swat0,3);
	TextDrawLetterSize(swat0,0.299999,1.000000);
	TextDrawFont(swat1,3);
	TextDrawLetterSize(swat1,0.399999,1.000000);
	TextDrawColor(swat0,0xffffffff);
	TextDrawColor(swat1,0xffffffff);
	TextDrawSetOutline(swat0,1);
	TextDrawSetOutline(swat1,1);
	TextDrawSetProportional(swat0,1);
	TextDrawSetProportional(swat1,1);
	TextDrawSetShadow(swat0,1);
	TextDrawSetShadow(swat1,1);

	hick0 = TextDrawCreate(69.000000,118.000000,"~y~the hicks~n~ ~n~~g~alias~n~~w~None~n~ ~n~~r~rivals~n~~w~bikers~n~ ~n~~y~respawn point~n~~w~wood hut");
	hick1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~brown red~n~ ~n~~y~weapons~n~~w~sawn-off~n~uzi~n~45mm~n~shovel");
	TextDrawAlignment(hick0,0);
	TextDrawAlignment(hick1,0);
	TextDrawBackgroundColor(hick0,0x000000ff);
	TextDrawBackgroundColor(hick1,0x000000ff);
	TextDrawFont(hick0,3);
	TextDrawLetterSize(hick0,0.299999,1.000000);
	TextDrawFont(hick1,3);
	TextDrawLetterSize(hick1,0.399999,1.000000);
	TextDrawColor(hick0,0xffffffff);
	TextDrawColor(hick1,0xffffffff);
	TextDrawSetOutline(hick0,1);
	TextDrawSetOutline(hick1,1);
	TextDrawSetProportional(hick0,1);
	TextDrawSetProportional(hick1,1);
	TextDrawSetShadow(hick0,1);
	TextDrawSetShadow(hick1,1);

	pilot0 = TextDrawCreate(69.000000,118.000000,"~y~The pilots~n~ ~n~~g~alias~n~~w~mechanics~n~ ~n~~r~rivals~n~~w~golfers~n~ ~n~~y~respawn point~n~~w~cargo plane");
	pilot1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~grey~n~ ~n~~y~weapons~n~~w~sniper~n~silenced 45mm~n~molotovs~n~parachute");
	TextDrawAlignment(pilot0,0);
	TextDrawAlignment(pilot1,0);
	TextDrawBackgroundColor(pilot0,0x000000ff);
	TextDrawBackgroundColor(pilot1,0x000000ff);
	TextDrawFont(pilot0,3);
	TextDrawLetterSize(pilot0,0.299999,1.000000);
	TextDrawFont(pilot1,3);
	TextDrawLetterSize(pilot1,0.399999,1.000000);
	TextDrawColor(pilot0,0xffffffff);
	TextDrawColor(pilot1,0xffffffff);
	TextDrawSetOutline(pilot0,1);
	TextDrawSetOutline(pilot1,1);
	TextDrawSetProportional(pilot0,1);
	TextDrawSetProportional(pilot1,1);
	TextDrawSetShadow(pilot0,1);
	TextDrawSetShadow(pilot1,1);

	rich0 = TextDrawCreate(69.000000,118.000000,"~y~The richs~n~ ~n~~g~alias~n~~w~golfers~n~ ~n~~r~rivals~n~~w~pimps~n~ ~n~~y~respawn point~n~~w~rich neighborhood");
	rich1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~peach~n~ ~n~~y~weapons~n~~w~m4~n~combat shotgun~n~desert eagle~n~grenades");
	TextDrawAlignment(rich0,0);
	TextDrawAlignment(rich1,0);
	TextDrawBackgroundColor(rich0,0x000000ff);
	TextDrawBackgroundColor(rich1,0x000000ff);
	TextDrawFont(rich0,3);
	TextDrawLetterSize(rich0,0.299999,1.000000);
	TextDrawFont(rich1,3);
	TextDrawLetterSize(rich1,0.399999,1.000000);
	TextDrawColor(rich0,0xffffffff);
	TextDrawColor(rich1,0xffffffff);
	TextDrawSetOutline(rich0,1);
	TextDrawSetOutline(rich1,1);
	TextDrawSetProportional(rich0,1);
	TextDrawSetProportional(rich1,1);
	TextDrawSetShadow(rich0,1);
	TextDrawSetShadow(rich1,1);

	nang0 = TextDrawCreate(69.000000,118.000000,"~y~The nang~n~ ~n~~g~alias~n~~w~pimps~n~ ~n~~r~rivals~n~~w~triads~n~ ~n~~y~respawn point~n~~w~cargo ship");
	nang1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~dark red~n~ ~n~~y~weapons~n~~w~combat shotgun~n~uzi~n~desert eagle~n~grenades");
	TextDrawAlignment(nang0,0);
	TextDrawAlignment(nang1,0);
	TextDrawBackgroundColor(nang0,0x000000ff);
	TextDrawBackgroundColor(nang1,0x000000ff);
	TextDrawFont(nang0,3);
	TextDrawLetterSize(nang0,0.299999,1.000000);
	TextDrawFont(nang1,3);
	TextDrawLetterSize(nang1,0.399999,1.000000);
	TextDrawColor(nang0,0xffffffff);
	TextDrawColor(nang1,0xffffffff);
	TextDrawSetOutline(nang0,1);
	TextDrawSetOutline(nang1,1);
	TextDrawSetProportional(nang0,1);
	TextDrawSetProportional(nang1,1);
	TextDrawSetShadow(nang0,1);
	TextDrawSetShadow(nang1,1);

	chicken0 = TextDrawCreate(69.000000,118.000000,"~y~The chickens~n~ ~n~~g~alias~n~~w~triads~n~ ~n~~r~rivals~n~~w~S.W.A.T.~n~ ~n~~y~respawn point~n~~w~Cluckin' Bell");
	chicken1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~Dark yellow~n~ ~n~~y~weapons~n~~w~Sawn-off~n~MP5~n~45mm~n~molotov");
	TextDrawAlignment(chicken0,0);
	TextDrawAlignment(chicken1,0);
	TextDrawBackgroundColor(chicken0,0x000000ff);
	TextDrawBackgroundColor(chicken1,0x000000ff);
	TextDrawFont(chicken0,3);
	TextDrawLetterSize(chicken0,0.299999,1.000000);
	TextDrawFont(chicken1,3);
	TextDrawLetterSize(chicken1,0.399999,1.000000);
	TextDrawColor(chicken0,0xffffffff);
	TextDrawColor(chicken1,0xffffffff);
	TextDrawSetOutline(chicken0,1);
	TextDrawSetOutline(chicken1,1);
	TextDrawSetProportional(chicken0,1);
	TextDrawSetProportional(chicken1,1);
	TextDrawSetShadow(chicken0,1);
	TextDrawSetShadow(chicken1,1);

	army0 = TextDrawCreate(69.000000,118.000000,"~y~army/justice~n~ ~n~~g~alias~n~~w~S.W.A.T.~n~ ~n~~r~rivals~n~~w~bikers~n~ ~n~~y~respawn point~n~~w~army ship");
	army1 = TextDrawCreate(69.000000,215.000000,"~y~color~n~~w~dark green~n~ ~n~~y~weapons~n~~w~M4~n~45mm~n~combat shotgun~n~grenades");
	TextDrawAlignment(army0,0);
	TextDrawAlignment(army1,0);
	TextDrawBackgroundColor(army0,0x000000ff);
	TextDrawBackgroundColor(army1,0x000000ff);
	TextDrawFont(army0,3);
	TextDrawLetterSize(army0,0.299999,1.000000);
	TextDrawFont(army1,3);
	TextDrawLetterSize(army1,0.399999,1.000000);
	TextDrawColor(army0,0xffffffff);
	TextDrawColor(army1,0xffffffff);
	TextDrawSetOutline(army0,1);
	TextDrawSetOutline(army1,1);
	TextDrawSetProportional(army0,1);
	TextDrawSetProportional(army1,1);
	TextDrawSetShadow(army0,1);
	TextDrawSetShadow(army1,1);

	//--objects
	CreateObject(14548,-1355.7847900391, -242.65003967285, 853.583984375, 0.000000, 0.000000, 18105.466326);

//spawninfo text


//Trains

//	AddStaticVehicle(537,-1943.3127,158.0254,27.0006,357.3614,121,1);
//	AddStaticVehicle(569,-1943.3127,158.0254,27.0006,357.3614,121,1);
//	AddStaticVehicle(569,-1943.3127,158.0254,27.0006,357.3614,121,1);
//	AddStaticVehicle(569,-1943.3127,158.0254,27.0006,357.3614,121,1);

	//Pickups
	AddStaticPickup(370, 15, -2209.4707,294.1174,35.1172); // jetpack
	AddStaticPickup(370, 15, -1765.4392,-174.7473,3.5547); // jetpack
	AddStaticPickup(370, 15, -2669.4919,921.7230,87.1120); //jetpack

	return 1;
}

public OnGameModeExit()
{
	return 1;
}

public OnPlayerRequestClass(playerid, classid)
{
	SetupPlayerForClassSelection(playerid);
	SetPlayerTeamFromClass(playerid,classid);

	switch (classid)
	{
	    case 0:
     	{
				//worker
				TextDrawShowForPlayer(playerid, worker0);
				TextDrawShowForPlayer(playerid, worker1);
				//hide
				TextDrawHideForPlayer(playerid, army0);
				TextDrawHideForPlayer(playerid, army1);
				TextDrawHideForPlayer(playerid, pimp0);
				TextDrawHideForPlayer(playerid, pimp1);
                SetPlayerPos(playerid, -2112.2437,176.7923,35.3929);
                SetPlayerFacingAngle(playerid,1);
                SetPlayerCameraPos(playerid, -2112.2803,181.6424,36.3327);
                SetPlayerCameraLookAt(playerid, -2112.2437,176.7923,35.3929);
		}
		case 1:
  		{
				//pimp
				TextDrawShowForPlayer(playerid, pimp0);
				TextDrawShowForPlayer(playerid, pimp1);
				//hide
				TextDrawHideForPlayer(playerid, worker0);
				TextDrawHideForPlayer(playerid, worker1);
				TextDrawHideForPlayer(playerid, golfer0);
				TextDrawHideForPlayer(playerid, golfer1);
                SetPlayerPos(playerid, -2716.8499,1434.0413,7.1875);
                SetPlayerFacingAngle(playerid,0);
                SetPlayerCameraPos(playerid, -2717.1458,1438.8533,8.3975);
                SetPlayerCameraLookAt(playerid, -2716.8499,1434.0413,7.1875);
		}
		case 2:
		{
				//golfer
				TextDrawShowForPlayer(playerid, golfer0);
				TextDrawShowForPlayer(playerid, golfer1);
				//hide
				TextDrawHideForPlayer(playerid, triad0);
				TextDrawHideForPlayer(playerid, triad1);
				TextDrawHideForPlayer(playerid, pimp0);
				TextDrawHideForPlayer(playerid, pimp1);
                SetPlayerPos(playerid, -2512.3667,-266.4278,38.9365);
                SetPlayerFacingAngle(playerid,0);
                SetPlayerCameraPos(playerid, -2512.5325,-261.5241,39.9224);
                SetPlayerCameraLookAt(playerid, -2512.3667,-266.4278,38.9365);
		}
		case 3:
		{
				//triad
				TextDrawShowForPlayer(playerid, triad0);
				TextDrawShowForPlayer(playerid, triad1);

				//hide
				TextDrawHideForPlayer(playerid, mechanic0);
				TextDrawHideForPlayer(playerid, mechanic1);
				TextDrawHideForPlayer(playerid, golfer0);
				TextDrawHideForPlayer(playerid, golfer1);
                SetPlayerPos(playerid, -2191.1252,607.3189,35.1641);
                SetPlayerFacingAngle(playerid,0);
                SetPlayerCameraPos(playerid, -2191.0605,611.9641,36.2765);
                SetPlayerCameraLookAt(playerid, -2191.1252,607.3189,35.1641);
		}
		case 4:
		{
				//mechanic
				TextDrawShowForPlayer(playerid, mechanic0);
				TextDrawShowForPlayer(playerid, mechanic1);
				//hide
				TextDrawHideForPlayer(playerid, triad0);
				TextDrawHideForPlayer(playerid, triad1);
				TextDrawHideForPlayer(playerid, biker0);
				TextDrawHideForPlayer(playerid, biker1);
                SetPlayerPos(playerid, -541.4526,-491.8309,25.5234);
                SetPlayerFacingAngle(playerid,180);
                SetPlayerCameraPos(playerid, -541.3816,-496.9438,26.6260);
                SetPlayerCameraLookAt(playerid, -541.4526,-491.8309,25.5234);
		}
		case 5:
		{
				//biker
				TextDrawShowForPlayer(playerid, biker0);
				TextDrawShowForPlayer(playerid, biker1);
				//hide
				TextDrawHideForPlayer(playerid, medic0);
				TextDrawHideForPlayer(playerid, medic1);
				TextDrawHideForPlayer(playerid, mechanic0);
				TextDrawHideForPlayer(playerid, mechanic1);
                SetPlayerPos(playerid, -595.8671,-1065.9160,23.4248);
				SetPlayerFacingAngle(playerid,295);
                SetPlayerCameraPos(playerid, -591.7051,-1063.6787,24.5159);
                SetPlayerCameraLookAt(playerid, -595.8671,-1065.9160,23.4248);
		}
		case 6:
		{
				//medic
				TextDrawShowForPlayer(playerid, medic0);
				TextDrawShowForPlayer(playerid, medic1);

				//hide
				TextDrawHideForPlayer(playerid, swat0);
				TextDrawHideForPlayer(playerid, swat1);
				TextDrawHideForPlayer(playerid, biker0);
				TextDrawHideForPlayer(playerid, biker1);
                SetPlayerPos(playerid, -2613.8987,598.3188,14.4531);
                SetPlayerFacingAngle(playerid,180);
                SetPlayerCameraPos(playerid, -2613.8223,593.5840,15.5394);
                SetPlayerCameraLookAt(playerid, -2613.8987,598.3188,14.4531);
		}
		case 7:
		{
				//swat
				TextDrawShowForPlayer(playerid, swat0);
				TextDrawShowForPlayer(playerid, swat1);

				//hide
				TextDrawHideForPlayer(playerid, hick0);
				TextDrawHideForPlayer(playerid, hick1);
				TextDrawHideForPlayer(playerid, medic0);
				TextDrawHideForPlayer(playerid, medic1);
                SetPlayerPos(playerid, -1600.3812,737.4028,-5.2422);
                SetPlayerFacingAngle(playerid,0);
                SetPlayerCameraPos(playerid, -1600.5311,741.8755,-4.1332);
                SetPlayerCameraLookAt(playerid, -1600.3812,737.4028,-5.2422);
		}
		case 8:
		{
				//hicks
				TextDrawShowForPlayer(playerid, hick0);
				TextDrawShowForPlayer(playerid, hick1);

				//hide
				TextDrawHideForPlayer(playerid, swat0);
				TextDrawHideForPlayer(playerid, swat1);
				TextDrawHideForPlayer(playerid, pilot0);
				TextDrawHideForPlayer(playerid, pilot1);
                SetPlayerPos(playerid, -527.5626,-96.3141,62.9619);
                SetPlayerFacingAngle(playerid,0);
                SetPlayerCameraPos(playerid, -527.9584,-91.4849,63.6649);
                SetPlayerCameraLookAt(playerid, -527.5626,-96.3141,62.9619);
		}
		case 9:
		{
				//pilots
				TextDrawShowForPlayer(playerid, pilot0);
				TextDrawShowForPlayer(playerid, pilot1);
				//hide
				TextDrawHideForPlayer(playerid, hick0);
				TextDrawHideForPlayer(playerid, hick1);
				TextDrawHideForPlayer(playerid, rich0);
				TextDrawHideForPlayer(playerid, rich1);

                SetPlayerPos(playerid, -1255.9720,-263.9608,14.1484);
                SetPlayerFacingAngle(playerid,0);
                SetPlayerCameraPos(playerid, -1256.4557,-258.9485,15.2540);
                SetPlayerCameraLookAt(playerid, -1255.9720,-263.9608,14.1484);
		}
		case 10:
		{
				//toreno
				TextDrawShowForPlayer(playerid, rich0);
				TextDrawShowForPlayer(playerid, rich1);

				//hide
				TextDrawHideForPlayer(playerid, pilot0);
				TextDrawHideForPlayer(playerid, pilot1);
				TextDrawHideForPlayer(playerid, nang0);
				TextDrawHideForPlayer(playerid, nang1);
   	            SetPlayerPos(playerid, -2680.3953,931.0175,79.7031);
				SetPlayerFacingAngle(playerid,0);
				SetPlayerCameraPos(playerid,-2680.5896,935.7803,80.8995);
				SetPlayerCameraLookAt(playerid, -2680.3953,931.0175,79.7031);
		}
		case 11:
		{
				//nang
				TextDrawShowForPlayer(playerid, nang0);
				TextDrawShowForPlayer(playerid, nang1);
				//hide
				TextDrawHideForPlayer(playerid, chicken0);
				TextDrawHideForPlayer(playerid, chicken1);
				TextDrawHideForPlayer(playerid, rich0);
				TextDrawHideForPlayer(playerid, rich1);

                SetPlayerPos(playerid, -1459.7673,1490.9714,8.2578);
                SetPlayerFacingAngle(playerid,85);
                SetPlayerCameraPos(playerid, -1464.5118,1490.9004,9.3470);
                SetPlayerCameraLookAt(playerid, -1459.7673,1490.9714,8.2578);
		}
		case 12:
		{
				//chickens
				TextDrawShowForPlayer(playerid, chicken0);
				TextDrawShowForPlayer(playerid, chicken1);
				//hide
				TextDrawHideForPlayer(playerid, army0);
				TextDrawHideForPlayer(playerid, army1);
				TextDrawHideForPlayer(playerid, nang0);
				TextDrawHideForPlayer(playerid, nang1);
                SetPlayerPos(playerid, -2671.8293,267.5992,4.3359);
                SetPlayerFacingAngle(playerid,0);
                SetPlayerCameraPos(playerid, -2671.7861,272.2567,5.4376);
                SetPlayerCameraLookAt(playerid, -2671.8293,267.5992,4.3359);
		}
		case 13:
		{
			//army
			TextDrawShowForPlayer(playerid, army0);
			TextDrawShowForPlayer(playerid, army1);
			//hide
			TextDrawHideForPlayer(playerid, worker0);
			TextDrawHideForPlayer(playerid, worker1);
			TextDrawHideForPlayer(playerid, chicken0);
			TextDrawHideForPlayer(playerid, chicken1);
            SetPlayerPos(playerid, -1399.3936,493.3810,18.2294);
            SetPlayerFacingAngle(playerid,85);
            SetPlayerCameraPos(playerid, -1404.4672,493.5200,19.3241);
            SetPlayerCameraLookAt(playerid, -1399.3936,493.3810,18.2294);
		}

	}
	return 1;
}

public OnPlayerConnect(playerid)
{
	return 1;
}

public OnPlayerDisconnect(playerid, reason)
{
	return 1;
}

public OnPlayerSpawn(playerid)
{
	//hide spawn info
	TextDrawHideForPlayer(playerid, army0);
	TextDrawHideForPlayer(playerid, army1);
	TextDrawHideForPlayer(playerid, nang0);
	TextDrawHideForPlayer(playerid, nang1);
	TextDrawHideForPlayer(playerid, worker0);
	TextDrawHideForPlayer(playerid, worker1);
	TextDrawHideForPlayer(playerid, rich0);
	TextDrawHideForPlayer(playerid, rich1);
	TextDrawHideForPlayer(playerid, golfer0);
	TextDrawHideForPlayer(playerid, golfer1);
	TextDrawHideForPlayer(playerid, pilot0);
	TextDrawHideForPlayer(playerid, pilot1);
	TextDrawHideForPlayer(playerid, biker0);
	TextDrawHideForPlayer(playerid, biker1);
	TextDrawHideForPlayer(playerid, swat0);
	TextDrawHideForPlayer(playerid, swat1);
	TextDrawHideForPlayer(playerid, pimp0);
	TextDrawHideForPlayer(playerid, pimp1);
	TextDrawHideForPlayer(playerid, triad0);
	TextDrawHideForPlayer(playerid, triad1);
	TextDrawHideForPlayer(playerid, mechanic0);
	TextDrawHideForPlayer(playerid, mechanic1);
	TextDrawHideForPlayer(playerid, chicken0);
	TextDrawHideForPlayer(playerid, chicken1);
	TextDrawHideForPlayer(playerid, hick0);
	TextDrawHideForPlayer(playerid, hick1);
	TextDrawHideForPlayer(playerid, rules0);
	TextDrawHideForPlayer(playerid, rules1);
	TextDrawHideForPlayer(playerid, rules2);
	TextDrawHideForPlayer(playerid, medic0);
	TextDrawHideForPlayer(playerid, medic1);
	
	SetPlayerToTeamColor(playerid);
	return 1;
}

public OnPlayerDeath(playerid, killerid, reason)
{
    DropPlayerWeapons(playerid);
	return 1;
}

public OnVehicleSpawn(vehicleid)
{
	return 1;
}

public OnVehicleDeath(vehicleid, killerid)
{
	return 1;
}

public OnPlayerText(playerid, text[])
{
	return 1;
}

public OnPlayerCommandText(playerid, cmdtext[])
{
	if (strcmp("/mycommand", cmdtext, true, 10) == 0)
	{
		// Do something here
		return 1;
	}
	else if (strcmp("/sos", cmdtext, true, 10) == 0)
	{
		SendClientMessage(playerid, COLOR_RED, "Estas siendo destrabado.");
		return 1;
	}
	else if (strcmp("/clase", cmdtext, true, 10) == 0)
	{
		SendClientMessage(playerid, COLOR_RED, "Cambiando de clase");
	    ForceClassSelection(playerid);
	    TogglePlayerSpectating(playerid, true);
	    TogglePlayerSpectating(playerid, false);
	    return 1;
	}
	else if (strcmp("/morir", cmdtext, true, 10) == 0)
	{
        SetPlayerHealth(playerid, 0);
	    return 1;
	}
	else if (strcmp("/nos", cmdtext, true, 10) == 0)
	{
		new playerState = GetPlayerState(playerid);
        if(playerState == PLAYER_STATE_DRIVER) {
        	new vehicleid = GetPlayerVehicleID(playerid);
        	AddVehicleComponent(vehicleid, 1010); // Add NOS to the vehicle
			SendClientMessage(playerid, COLOR_YELLOW, "Más rápido y más furioso!");
		}
		else {
			SendClientMessage(playerid, COLOR_RED, "Necesitas estar en un vehículo para aplicar nitro.");
		}
	    return 1;
	}
	return 0;
}

public OnPlayerEnterVehicle(playerid, vehicleid, ispassenger)
{
	return 1;
}

public OnPlayerExitVehicle(playerid, vehicleid)
{
	return 1;
}

public OnPlayerStateChange(playerid, newstate, oldstate)
{
	return 1;
}

public OnPlayerEnterCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveCheckpoint(playerid)
{
	return 1;
}

public OnPlayerEnterRaceCheckpoint(playerid)
{
	return 1;
}

public OnPlayerLeaveRaceCheckpoint(playerid)
{
	return 1;
}

public OnRconCommand(cmd[])
{
	return 1;
}

public OnPlayerRequestSpawn(playerid)
{
	return 1;
}

public OnObjectMoved(objectid)
{
	return 1;
}

public OnPlayerObjectMoved(playerid, objectid)
{
	return 1;
}

public OnPlayerPickUpPickup(playerid, pickupid)
{
	return 1;
}

public OnVehicleMod(playerid, vehicleid, componentid)
{
	return 1;
}

public OnVehiclePaintjob(playerid, vehicleid, paintjobid)
{
	return 1;
}

public OnVehicleRespray(playerid, vehicleid, color1, color2)
{
	return 1;
}

public OnPlayerSelectedMenuRow(playerid, row)
{
	return 1;
}

public OnPlayerExitedMenu(playerid)
{
	return 1;
}

public OnPlayerInteriorChange(playerid, newinteriorid, oldinteriorid)
{
	return 1;
}

public OnPlayerKeyStateChange(playerid, newkeys, oldkeys)
{
	return 1;
}

public OnRconLoginAttempt(ip[], password[], success)
{
	return 1;
}

public OnPlayerUpdate(playerid)
{
	return 1;
}

public OnPlayerStreamIn(playerid, forplayerid)
{
	return 1;
}

public OnPlayerStreamOut(playerid, forplayerid)
{
	return 1;
}

public OnVehicleStreamIn(vehicleid, forplayerid)
{
	return 1;
}

public OnVehicleStreamOut(vehicleid, forplayerid)
{
	return 1;
}

public OnDialogResponse(playerid, dialogid, response, listitem, inputtext[])
{
	return 1;
}

public OnPlayerClickPlayer(playerid, clickedplayerid, source)
{
	return 1;
}
//--------------------------------- FEATURES ----------------------------

//Drop weapons al morir
public DropPlayerWeapons(playerid)
{
    new playerweapons[13][2];
    new Float:x,Float:y,Float:z;
    GetPlayerPos(playerid, x, y, z);

	for(new i=0; i<13; i++)
	{
    	GetPlayerWeaponData(playerid, i, playerweapons[i][0], playerweapons[i][1]);
    	new model = GetWeaponModel(playerweapons[i][0]);
		new times = floatround(playerweapons[i][1]/10.0001);
    	new Float:X = x + (random(3) - random(3));
    	new Float:Y = y + (random(3) - random(3));
    	if(playerweapons[i][1] != 0 && model != -1)
		{
		    if(times > DropLimit) times = DropLimit;
	    	for(new a=0; a<times; a++)
			{
				new pickupid = CreatePickup(model, 3, X, Y, z);
				SetTimerEx("DeletePickup", DeleteTime*1000, false, "d", pickupid);
			}
		}
	}
	return 1;
}

public DeletePickup(pickupid)
{
	DestroyPickup(pickupid);
	return 1;
}

GetWeaponModel(weaponid)
{
	switch(weaponid)
	{
	    case 1: return 331; case 2: return 333; case 3: return 334;
		case 4: return 335; case 5: return 336; case 6: return 337;
		case 7: return 338; case 8: return 339; case 9: return 341;
		case 10: return 321; case 11: return 322; case 12: return 323;
		case 13: return 324; case 14: return 325; case 15: return 326;
		case 16: return 342; case 17: return 343; case 18: return 344;
		case 22: return 346; case 23: return 347; case 24: return 348;
		case 25: return 349; case 26: return 350; case 27: return 351;
		case 28: return 352; case 29: return 353; case 30: return 355;
		case 31: return 356; case 32: return 372; case 33: return 357;
		case 34: return 358; case 35: return 359; case 36: return 360;
		case 37: return 361; case 38: return 362; case 39: return 363;
		case 41: return 365; case 42: return 366; case 46: return 371;
	}
	return -1;
}
