//====== SA-MP IN-GAME CAR'S SPAWNER =======//
//========    Created by: Fedee!    =======//
//======= Credits to GTAguillaume ========//
//=========  And to cepiokas =============//
#define FILTERSCRIPT
#include <a_samp>
#if defined FILTERSCRIPT
#define GELTONA 0xFFFF00FF
#define BALTA 0xFFFFFFFF
#define COLOR_GREY 0xAFAFAFAA
#pragma tabsize 0
new SpawnedVehicles[MAX_PLAYERS];
// === Respawn Things.. === //
forward IsVehicleOccupied(vehicleid);
// ======================== //
public OnPlayerCommandText(playerid, cmdtext[])
{   //=== MENU ===//
       if(strcmp(cmdtext,"/cars",true)==0)
   {
      GameTextForPlayer(playerid,"~w~~h~IN-GAME CAR SPAWNER~n~by:~r~~h~Fedee!",2500,1);
      SendClientMessage(playerid,GELTONA,"=========================== CARS ========================");
      SendClientMessage(playerid,BALTA,"=== /huntley /landstalker /perrenial /rancher /rancher2 /regina /banshee /bullet /zr-350 /benson /dumper ===");
      SendClientMessage(playerid,BALTA,"=== /romero /solair /alpha /blista /bravura /buccaneer /cadrona /cheetah /comet /turismo /windsor /dozer ===");
      SendClientMessage(playerid,BALTA,"=== /club /esperanto /feltzer /fortune /hermes /hustler /majestic /hotknife /infernus /supergt /mesa ===");
      SendClientMessage(playerid,BALTA,"=== /manana /picador /previon /stafford /stallion /tampa /virgo /hotring /hotringa /hotringb /dft-30 ===");
      SendClientMessage(playerid,BALTA,"=== /admiral /elegant /emperor /euros /glendale /glendale2 /greenwood /boxville /boxville2 /cementtruck ===");
      SendClientMessage(playerid,BALTA,"=== /intruder /merit /nebula /oceanic /premier /primo /sentinel /stretch /dune /flatbed /hotdog /linerunner ===");
      SendClientMessage(playerid,BALTA,"=== /sunrise /tahoma /vincent /washington /willard /buffalo /clover /mrwoopee /mule /packer /roadtrain ===");
      SendClientMessage(playerid,BALTA,"=== /phoenix /sabre /elegy /flash /jester /stratum /sultan /uranus /tanker /tractor /yankee /topfun ===");
      SendClientMessage(playerid,BALTA,"=== /bobcat /burrito /forklift /moonbeam /mower /newsvan /pony /rumpo /sadler /sadler2 /tug /walton ===");
      SendClientMessage(playerid,BALTA,"=== /blade /broadway /remington /savanna /slamvan /tornado /voodoo /yosemite /linerunner  /combine ===");
      SendClientMessage(playerid,GELTONA,"=== /other /bikes /public /security /aircrafts /boats /rccars ===");
      return 1;
   }
       if(strcmp(cmdtext,"/other",true)==0)
   {
      SendClientMessage(playerid,GELTONA,"=========================== OTHER ========================");
      SendClientMessage(playerid,BALTA,"=== /bandito /bfinjection /bloodringbanger /caddy /camper /journey /kart /monster /monstera /monsterb ===");
      SendClientMessage(playerid,BALTA,"=== /quad /sandking /vortex ===");
       return 1;
       }
       if(strcmp(cmdtext,"/bikes",true) == 0)
   {
      SendClientMessage(playerid,GELTONA,"=========================== BIKES ========================");
      SendClientMessage(playerid,BALTA,"=== /bmx /bike /mountainbike /bf-400 /faggio /fcr-900 /freeway /nrg-500 /pcj-600 /pizzaboy /sanchez /wayfarer ===");
      return 1;
      }
       if(strcmp(cmdtext,"/public",true)==0)
   {
      SendClientMessage(playerid,GELTONA,"=========================== PUBLIC ========================");
      SendClientMessage(playerid,BALTA,"=== /baggage /bus /ambulance /cabbie /coach /sweeper /taxi /towtruck /trashmaster /utilityvan ===");
      return 1;
      }
       if(strcmp(cmdtext,"/security",true)==0)
   {
      SendClientMessage(playerid,GELTONA,"*=========================== SECURITY ========================");
      SendClientMessage(playerid,BALTA,"=== /barracks /enforcer /fbirancher /fbitruck /firetruck /firetrucka /hpv-1000 /patriot /rhino ===");
      SendClientMessage(playerid,BALTA,"=== /policels /policesf /policelv /policeranger /securicar /swattank ===");
      return 1;
      }
        if(strcmp(cmdtext,"/aircrafts",true)==0)
   {
      SendClientMessage(playerid,GELTONA,"*=========================== AIRCRAFTS ========================");
        SendClientMessage(playerid,BALTA,"=== /andromada /at-400 /beagle /cargobob /cropduster /dodo /hunter /leviathon /maverick /nevada /hydra ===");
        SendClientMessage(playerid,BALTA,"=== /newsmaverick /policemaverick /raindance /rustler /seasparrow /shamal /skimmer /sparrow /stuntplane ===");
      return 1;
      }
       if(strcmp(cmdtext,"/boats",true)==0)
   {
      SendClientMessage(playerid,GELTONA,"*=========================== BOATS ========================");
        SendClientMessage(playerid,BALTA,"=== /coastguard /dingy /jetmax /launch /marquis /predator /reefer /speeder /squallo /tropic ===");
      return 1;
      }
       if(strcmp(cmdtext,"/rccars",true)==0)
   {
      SendClientMessage(playerid,GELTONA,"*=========================== RC CARS ========================");
        SendClientMessage(playerid,BALTA,"=== /rcbandit /rcbaron /rccam /rcgoblin /rcgoblin2 /rctiger ===");
      return 1;
      }
      // === Respawn Command === //
   if(strcmp(cmdtext, "/respawncars", true) == 0)
   {
      if (IsPlayerAdmin(playerid))
      {
         for(new i=0;i<MAX_VEHICLES;i++)
         {
             if(IsVehicleOccupied(i) == 0)
             {
                 SetVehicleToRespawn(i);
             }
         }
         SendClientMessageToAll(COLOR_GREY, "All vehicles respawned succesfully by Admin!");
      }
      else
      {
         SendClientMessage(playerid,COLOR_GREY, "You are not allowed to use this command!");
      }
      return 1;
   }
   // ===CARS=== ///

       if (!strcmp("/Landstalker", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(400,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Landstalker~n~~h~~w~ID:~h~~r~400",2500,1);
        return 1;
}

       if (!strcmp("/Bravura", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(401,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Bravura~n~~h~~w~ID:~h~~r~401",2500,1);
        return 1;
}

       if (!strcmp("/Buffalo", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(402,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Buffalo~n~~h~~w~ID:~h~~r~402",2500,1);
        return 1;
}

       if (!strcmp("/Linerunner", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(403,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Linerunner~n~~h~~w~ID:~h~~r~403",2500,1);
        return 1;
}

       if (!strcmp("/Perenniel", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(404,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Perenniel~n~~h~~w~ID:~h~~r~404",2500,1);
        return 1;
}

       if (!strcmp("/Sentinel", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(405,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Sentinel~n~~h~~w~ID:~h~~r~405",2500,1);
        return 1;
}

       if (!strcmp("/Dumper", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(406,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Dumper~n~~h~~w~ID:~h~~r~406",2500,1);
        return 1;
}

       if (!strcmp("/Firetruck", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(407,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Firetruck~n~~h~~w~ID:~h~~r~407",2500,1);
        return 1;
}

       if (!strcmp("/Trashmaster", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(408,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Trashmaster~n~~h~~w~ID:~h~~r~408",2500,1);
        return 1;
}

       if (!strcmp("/Stretch", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(409,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Stretch~n~~h~~w~ID:~h~~r~409",2500,1);
        return 1;
}

       if (!strcmp("/Manana", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(410,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Manana~n~~h~~w~ID:~h~~r~410",2500,1);
        return 1;
}

       if (!strcmp("/Infernus", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(411,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Infernus~n~~h~~w~ID:~h~~r~411",2500,1);
        return 1;
}
if (!strcmp("/Voodoo", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(412,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Voodoo~n~~h~~w~ID:~h~~r~412",2500,1);
        return 1;
}
if (!strcmp("/Pony", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(413,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Pony~n~~h~~w~ID:~h~~r~413",2500,1);
        return 1;
}
if (!strcmp("/Mule", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(414,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Mule~n~~h~~w~ID:~h~~r~414",2500,1);
        return 1;
}
if (!strcmp("/Cheetah", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(415,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Cheetah~n~~h~~w~ID:~h~~r~415",2500,1);
        return 1;
}
if (!strcmp("/Ambulance", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(416,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Ambulance~n~~h~~w~ID:~h~~r~416",2500,1);
        return 1;
}
if (!strcmp("/Leviathan", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(417,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Leviathan~n~~h~~w~ID:~h~~r~417",2500,1);
        return 1;
}
if (!strcmp("/Moonbeam", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(418,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Moonbeam~n~~h~~w~ID:~h~~r~418",2500,1);
        return 1;
}
if (!strcmp("/Esperanto", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(419,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Esperanto~n~~h~~w~ID:~h~~r~419",2500,1);
        return 1;
}
if (!strcmp("/Taxi", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(420,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Taxi~n~~h~~w~ID:~h~~r~420",2500,1);
        return 1;
}
if (!strcmp("/Washington", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(421,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Washington~n~~h~~w~ID:~h~~r~421",2500,1);
        return 1;
}
if (!strcmp("/Bobcat", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(422,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Bobcat~n~~h~~w~ID:~h~~r~422",2500,1);
        return 1;
}
if (!strcmp("/MrWhoopee", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(423,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Mr Whoopee~n~~h~~w~ID:~h~~r~423",2500,1);
        return 1;
}
if (!strcmp("/BFInjection", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(424,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~BF Injection~n~~h~~w~ID:~h~~r~424",2500,1);
        return 1;
}
if (!strcmp("/Hunter", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(425,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Hunter~n~~h~~w~ID:~h~~r~425",2500,1);
        return 1;
}
if (!strcmp("/Premier", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(426,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Premier~n~~h~~w~ID:~h~~r~426",2500,1);
        return 1;
}
if (!strcmp("/Enforcer", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(427,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Enforcer~n~~h~~w~ID:~h~~r~427",2500,1);
        return 1;
}
if (!strcmp("/Securicar", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(428,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Securicar~n~~h~~w~ID:~h~~r~428",2500,1);
        return 1;
}
if (!strcmp("/Banshee", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(429,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Banshee~n~~h~~w~ID:~h~~r~429",2500,1);
        return 1;
}
if (!strcmp("/Predator", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(430,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Predator~n~~h~~w~ID:~h~~r~430",2500,1);
        return 1;
}
if (!strcmp("/Bus", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(431,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Bus~n~~h~~w~ID:~h~~r~431",2500,1);
        return 1;
}
if (!strcmp("/Rhino", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(432,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Rhino~n~~h~~w~ID:~h~~r~432",2500,1);
        return 1;
}
if (!strcmp("/Barracks", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(433,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Barracks~n~~h~~w~ID:~h~~r~433",2500,1);
        return 1;
}
if (!strcmp("/Hotknife", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(434,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Hotknife~n~~h~~w~ID:~h~~r~434",2500,1);
        return 1;
}
if (!strcmp("/Previon", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(436,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Previon~n~~h~~w~ID:~h~~r~436",2500,1);
        return 1;
}
if (!strcmp("/Coach", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(437,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Coach~n~~h~~w~ID:~h~~r~437",2500,1);
        return 1;
}
if (!strcmp("/Cabbie", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(438,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Cabbie~n~~h~~w~ID:~h~~r~438",2500,1);
        return 1;
}
if (!strcmp("/Stallion", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(439,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Stallion~n~~h~~w~ID:~h~~r~439",2500,1);
        return 1;
}
if (!strcmp("/Rumpo", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(440,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Rumpo~n~~h~~w~ID:~h~~r~440",2500,1);
        return 1;
}
if (!strcmp("/RCBandit", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(441,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~RC Bandit~n~~h~~w~ID:~h~~r~441",2500,1);
        return 1;
}
if (!strcmp("/Romero", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(442,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Romero~n~~h~~w~ID:~h~~r~442",2500,1);
        return 1;
}
if (!strcmp("/Packer", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(443,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Packer~n~~h~~w~ID:~h~~r~443",2500,1);
        return 1;
}
if (!strcmp("/Monster", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(444,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Monster~n~~h~~w~ID:~h~~r~444",2500,1);
        return 1;
}
if (!strcmp("/Admiral", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(445,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Admiral~n~~h~~w~ID:~h~~r~445",2500,1);
        return 1;
}
if (!strcmp("/Squallo", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(446,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Squallo~n~~h~~w~ID:~h~~r~446",2500,1);
        return 1;
}
if (!strcmp("/Seasparrow", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(447,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Seasparrow~n~~h~~w~ID:~h~~r~447",2500,1);
        return 1;
}
if (!strcmp("/Pizzaboy", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(448,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Pizzaboy~n~~h~~w~ID:~h~~r~448",2500,1);
        return 1;
}
if (!strcmp("/Turismo", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(451,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Turismo~n~~h~~w~ID:~h~~r~451",2500,1);
        return 1;
}
if (!strcmp("/Speeder", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(452,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Speeder~n~~h~~w~ID:~h~~r~452",2500,1);
        return 1;
}
if (!strcmp("/Reefer", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(453,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Reefer~n~~h~~w~ID:~h~~r~453",2500,1);
        return 1;
}
if (!strcmp("/Tropic", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(454,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Tropic~n~~h~~w~ID:~h~~r~454",2500,1);
        return 1;
}
if (!strcmp("/Flatbed", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(455,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Flatbed~n~~h~~w~ID:~h~~r~455",2500,1);
        return 1;
}
if (!strcmp("/Yankee", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(456,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Yankee~n~~h~~w~ID:~h~~r~456",2500,1);
        return 1;
}
if (!strcmp("/Caddy", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(457,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Caddy~n~~h~~w~ID:~h~~r~457",2500,1);
        return 1;
}
if (!strcmp("/Solair", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(458,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Solair~n~~h~~w~ID:~h~~r~458",2500,1);
        return 1;
}
if (!strcmp("/Skimmer", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(460,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Skimmer~n~~h~~w~ID:~h~~r~460",2500,1);
        return 1;
}
if (!strcmp("/PCJ-600", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(461,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~PCJ-600~n~~h~~w~ID:~h~~r~461",2500,1);
        return 1;
}
if (!strcmp("/Faggio", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(440,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Rumpo~n~~h~~w~ID:~h~~r~440",2500,1);
        return 1;
}
if (!strcmp("/Rumpo", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(440,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Rumpo~n~~h~~w~ID:~h~~r~440",2500,1);
        return 1;
}
if (!strcmp("/Rumpo", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(440,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Rumpo~n~~h~~w~ID:~h~~r~440",2500,1);
        return 1;
}
if (!strcmp("/Rumpo", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(462,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Faggio~n~~h~~w~ID:~h~~r~462",2500,1);
        return 1;
}
if (!strcmp("/Freeway", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(463,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Freeway~n~~h~~w~ID:~h~~r~463",2500,1);
        return 1;
}
if (!strcmp("/RCBaron", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(464,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~RC Baron~n~~h~~w~ID:~h~~r~464",2500,1);
        return 1;
}
if (!strcmp("/RCRaider", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(465,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~RC Raider~n~~h~~w~ID:~h~~r~465",2500,1);
        return 1;
}
if (!strcmp("/Glendale", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(466,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Glendale~n~~h~~w~ID:~h~~r~466",2500,1);
        return 1;
}
if (!strcmp("/Oceanic", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(467,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Oceanic~n~~h~~w~ID:~h~~r~467",2500,1);
        return 1;
}if (!strcmp("/Sanchez", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(468,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Sanchez~n~~h~~w~ID:~h~~r~468",2500,1);
        return 1;
}
if (!strcmp("/Sparrow", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(469,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Sparrow~n~~h~~w~ID:~h~~r~469",2500,1);
        return 1;
}
if (!strcmp("/Patriot", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(470,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Patriot~n~~h~~w~ID:~h~~r~470",2500,1);
        return 1;
}
if (!strcmp("/Quad", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(471,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Quad~n~~h~~w~ID:~h~~r~471",2500,1);
        return 1;
}
if (!strcmp("/Coastguard", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(472,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Coastguard~n~~h~~w~ID:~h~~r~472",2500,1);
        return 1;
}
if (!strcmp("/Dinghy", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(473,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Dinghy~n~~h~~w~ID:~h~~r~473",2500,1);
        return 1;
}
if (!strcmp("/Hermes", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(474,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Hermes~n~~h~~w~ID:~h~~r~474",2500,1);
        return 1;
}
if (!strcmp("/Sabre", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(475,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Sabre~n~~h~~w~ID:~h~~r~475",2500,1);
        return 1;
}
if (!strcmp("/Rustler", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(476,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Rustler~n~~h~~w~ID:~h~~r~476",2500,1);
        return 1;
}
if (!strcmp("/ZR-350", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(477,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~ZR-350~n~~h~~w~ID:~h~~r~477",2500,1);
        return 1;
}
if (!strcmp("/Walton", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(478,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Walton~n~~h~~w~ID:~h~~r~478",2500,1);
        return 1;
}
if (!strcmp("/Regina", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(479,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Regina~n~~h~~w~ID:~h~~r~479",2500,1);
        return 1;
}
if (!strcmp("/Comet", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(480,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Comet~n~~h~~w~ID:~h~~r~480",2500,1);
        return 1;
}
if (!strcmp("/BMX", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(481,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~BMX~n~~h~~w~ID:~h~~r~481",2500,1);
        return 1;
}
if (!strcmp("/Burrito", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(482,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Burrito~n~~h~~w~ID:~h~~r~482",2500,1);
        return 1;
}
if (!strcmp("/Camper", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(483,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Camper~n~~h~~w~ID:~h~~r~483",2500,1);
        return 1;
}
if (!strcmp("/Marquis", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(484,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Marquis~n~~h~~w~ID:~h~~r~484",2500,1);
        return 1;
}
if (!strcmp("/Baggage", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(485,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Baggage~n~~h~~w~ID:~h~~r~485",2500,1);
        return 1;
}
if (!strcmp("/Dozer", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(486,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Dozer~n~~h~~w~ID:~h~~r~486",2500,1);
        return 1;
}
if (!strcmp("/Maverick", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(487,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Maverick~n~~h~~w~ID:~h~~r~487",2500,1);
        return 1;
}
if (!strcmp("/Rancher", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(489,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Rancher~n~~h~~w~ID:~h~~r~489",2500,1);
        return 1;
}
if (!strcmp("/FBIRancher", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(490,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~FBI Rancher~n~~h~~w~ID:~h~~r~490",2500,1);
        return 1;
}
if (!strcmp("/Virgo", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(491,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Virgo~n~~h~~w~ID:~h~~r~491",2500,1);
        return 1;
}
if (!strcmp("/Greenwood", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(492,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Greenwood~n~~h~~w~ID:~h~~r~492",2500,1);
        return 1;
}
if (!strcmp("/Jetmax", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(493,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Jetmax~n~~h~~w~ID:~h~~r~493",2500,1);
        return 1;
}
if (!strcmp("/Hotring", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(494,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Hotring~n~~h~~w~ID:~h~~r~494",2500,1);
        return 1;
}
if (!strcmp("/Sandking", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(495,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Sandking~n~~h~~w~ID:~h~~r~495",2500,1);
        return 1;
}
if (!strcmp("/Blista", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(496,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Blista Compact~n~~h~~w~ID:~h~~r~496",2500,1);
        return 1;
}
if (!strcmp("/PoliceMaverick", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(497,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Police Maverick~n~~h~~w~ID:~h~~r~497",2500,1);
        return 1;
}
if (!strcmp("/Boxville", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(498,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Boxville~n~~h~~w~ID:~h~~r~498",2500,1);
        return 1;
}
if (!strcmp("/Benson", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(499,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Benson~n~~h~~w~ID:~h~~r~499",2500,1);
        return 1;
}
if (!strcmp("/Mesa", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(500,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Mesa~n~~h~~w~ID:~h~~r~500",2500,1);
        return 1;
}
if (!strcmp("/RCGoblin", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(501,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~RC Goblin~n~~h~~w~ID:~h~~r~501",2500,1);
        return 1;
}
if (!strcmp("/HotringA", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(502,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Hotring A~n~~h~~w~ID:~h~~r~502",2500,1);
        return 1;
}
if (!strcmp("/HotringB", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(503,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Hotring B~n~~h~~w~ID:~h~~r~503",2500,1);
        return 1;
}
if (!strcmp("/BloodringBanger", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(504,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Bloodring Banger~n~~h~~w~ID:~h~~r~504",2500,1);
        return 1;
}
if (!strcmp("/Rancher", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(505,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Rancher~n~~h~~w~ID:~h~~r~505",2500,1);
        return 1;
}
if (!strcmp("/SuperGT", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(506,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Super GT~n~~h~~w~ID:~h~~r~506",2500,1);
        return 1;
}
if (!strcmp("/Elegant", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(507,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Elegant~n~~h~~w~ID:~h~~r~507",2500,1);
        return 1;
                }
if (!strcmp("/Journey", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(508,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Journey~n~~h~~w~ID:~h~~r~508",2500,1);
        return 1;
}
if (!strcmp("/Bike", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(509,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Bike~n~~h~~w~ID:~h~~r~509",2500,1);
        return 1;
}if (!strcmp("/MountainBike", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(510,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Mountain Bike~n~~h~~w~ID:~h~~r~510",2500,1);
        return 1;
}if (!strcmp("/Beagle", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(511,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Beagle~n~~h~~w~ID:~h~~r~511",2500,1);
        return 1;
}if (!strcmp("/Cropduster", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(512,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Cropduster~n~~h~~w~ID:~h~~r~512",2500,1);
        return 1;
}if (!strcmp("/Stuntplane", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(513,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Stuntplane~n~~h~~w~ID:~h~~r~513",2500,1);
        return 1;
}if (!strcmp("/Tanker", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(514,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Tanker~n~~h~~w~ID:~h~~r~514",2500,1);
        return 1;
}if (!strcmp("/Roadtrain", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(515,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Roadtrain~n~~h~~w~ID:~h~~r~515",2500,1);
        return 1;
}if (!strcmp("/Nebula", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(516,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Nebula~n~~h~~w~ID:~h~~r~516",2500,1);
        return 1;
}if (!strcmp("/Majestic", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(517,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Majestic~n~~h~~w~ID:~h~~r~517",2500,1);
        return 1;
}if (!strcmp("/Buccaneer", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(518,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Buccaneer~n~~h~~w~ID:~h~~r~518",2500,1);
        return 1;
}if (!strcmp("/Shamal", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(519,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Shamal~n~~h~~w~ID:~h~~r~519",2500,1);
        return 1;
}if (!strcmp("/Hydra", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(520,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Hydra~n~~h~~w~ID:~h~~r~520",2500,1);
        return 1;
}if (!strcmp("/FCR-900", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(521,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~FCR-900~n~~h~~w~ID:~h~~r~521",2500,1);
        return 1;
}if (!strcmp("/NRG-500", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(522,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~NRG-500~n~~h~~w~ID:~h~~r~522",2500,1);
        return 1;
}if (!strcmp("/HPV-1000", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(523,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~HPV1000~n~~h~~w~ID:~h~~r~523",2500,1);
        return 1;
}if (!strcmp("/CementTruck", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(524,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Cement Truck~n~~h~~w~ID:~h~~r~524",2500,1);
        return 1;
}if (!strcmp("/Towtruck", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(525,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Towtruck~n~~h~~w~ID:~h~~r~525",2500,1);
        return 1;
}if (!strcmp("/Fortune", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(526,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Fortune~n~~h~~w~ID:~h~~r~526",2500,1);
        return 1;
}if (!strcmp("/Cadrona", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(527,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Cadrona~n~~h~~w~ID:~h~~r~527",2500,1);
        return 1;
}if (!strcmp("/FBITruck", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(528,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~FBI Truck~n~~h~~w~ID:~h~~r~528",2500,1);
        return 1;
}if (!strcmp("/Willard", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(529,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Willard~n~~h~~w~ID:~h~~r~529",2500,1);
        return 1;
}if (!strcmp("/Forklift", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(530,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Forklift~n~~h~~w~ID:~h~~r~530",2500,1);
        return 1;
}if (!strcmp("/Tractor", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(531,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Tractor~n~~h~~w~ID:~h~~r~531",2500,1);
        return 1;
}if (!strcmp("/Combine", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(532,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Combine Harvester~n~~h~~w~ID:~h~~r~532",2500,1);
        return 1;
}if (!strcmp("/Feltzer", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(533,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Feltzer~n~~h~~w~ID:~h~~r~533",2500,1);
        return 1;
}if (!strcmp("/Remington", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(534,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Remington~n~~h~~w~ID:~h~~r~534",2500,1);
        return 1;
}if (!strcmp("/Slamvan", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(535,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Slamvan~n~~h~~w~ID:~h~~r~535",2500,1);
        return 1;
}if (!strcmp("/Blade", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(536,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Blade~n~~h~~w~ID:~h~~r~536",2500,1);
        return 1;
}if (!strcmp("/Vortex", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(539,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Vortex~n~~h~~w~ID:~h~~r~539",2500,1);
        return 1;
}if (!strcmp("/Vincent", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(540,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Vincent~n~~h~~w~ID:~h~~r~540",2500,1);
        return 1;
}if (!strcmp("/Bullet", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(541,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Bullet~n~~h~~w~ID:~h~~r~541",2500,1);
        return 1;
}if (!strcmp("/Clover", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(542,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Clover~n~~h~~w~ID:~h~~r~542",2500,1);
        return 1;
}if (!strcmp("/Sadler", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(543,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Sadler~n~~h~~w~ID:~h~~r~543",2500,1);
        return 1;
}if (!strcmp("/FiretruckA", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(544,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Firetruck A~n~~h~~w~ID:~h~~r~544",2500,1);
        return 1;
}if (!strcmp("/Hustler", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(545,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Hustler~n~~h~~w~ID:~h~~r~545",2500,1);
        return 1;
}if (!strcmp("/Intruder", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(546,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Intruder~n~~h~~w~ID:~h~~r~546",2500,1);
        return 1;
}if (!strcmp("/Primo", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(547,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Primo~n~~h~~w~ID:~h~~r~547",2500,1);
        return 1;
}if (!strcmp("/Cargobob", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(548,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Cargobob~n~~h~~w~ID:~h~~r~548",2500,1);
        return 1;
}if (!strcmp("/Tampa", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(549,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Tampa~n~~h~~w~ID:~h~~r~549",2500,1);
        return 1;
}if (!strcmp("/Sunrise", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(550,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Sunrise~n~~h~~w~ID:~h~~r~550",2500,1);
        return 1;
}if (!strcmp("/Merit", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(551,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Merit~n~~h~~w~ID:~h~~r~551",2500,1);
        return 1;
}if (!strcmp("/UtilityVan", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(552,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Utility Van~n~~h~~w~ID:~h~~r~552",2500,1);
        return 1;
}if (!strcmp("/Nevada", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(553,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Nevada~n~~h~~w~ID:~h~~r~553",2500,1);
        return 1;
}if (!strcmp("/Yosemite", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(554,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Yosemite~n~~h~~w~ID:~h~~r~554",2500,1);
        return 1;
}if (!strcmp("/Windsor", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(555,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Windsor~n~~h~~w~ID:~h~~r~555",2500,1);
        return 1;
}if (!strcmp("/MonsterA", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(556,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Monster A~n~~h~~w~ID:~h~~r~556",2500,1);
        return 1;
}if (!strcmp("/MonsterB", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(557,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Monster B~n~~h~~w~ID:~h~~r~557",2500,1);
        return 1;
}if (!strcmp("/Uranus", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(558,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Uranus~n~~h~~w~ID:~h~~r~558",2500,1);
        return 1;
}if (!strcmp("/Jester", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(559,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Jester~n~~h~~w~ID:~h~~r~559",2500,1);
        return 1;
}if (!strcmp("/Sultan", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(560,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Sultan~n~~h~~w~ID:~h~~r~560",2500,1);
        return 1;
}if (!strcmp("/Stratum", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(561,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Stratum~n~~h~~w~ID:~h~~r~561",2500,1);
        return 1;
}if (!strcmp("/Elegy", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(562,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Elegy~n~~h~~w~ID:~h~~r~562",2500,1);
        return 1;
}if (!strcmp("/Raindance", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(563,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Raindance~n~~h~~w~ID:~h~~r~563",2500,1);
        return 1;
}if (!strcmp("/RCTiger", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(564,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~RC Tiger~n~~h~~w~ID:~h~~r~564",2500,1);
        return 1;
}if (!strcmp("/Flash", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(565,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Flash~n~~h~~w~ID:~h~~r~565",2500,1);
        return 1;
}if (!strcmp("/Tahoma", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(566,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Tahoma~n~~h~~w~ID:~h~~r~566",2500,1);
        return 1;
}if (!strcmp("/Savanna", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(567,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Savanna~n~~h~~w~ID:~h~~r~567",2500,1);
        return 1;
}if (!strcmp("/Bandito", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(568,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Bandito~n~~h~~w~ID:~h~~r~568",2500,1);
        return 1;
}if (!strcmp("/Kart", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(571,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Kart~n~~h~~w~ID:~h~~r~571",2500,1);
        return 1;
}if (!strcmp("/Mower", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(572,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Mower~n~~h~~w~ID:~h~~r~572",2500,1);
        return 1;
}if (!strcmp("/Dune", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(573,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Dune~n~~h~~w~ID:~h~~r~573",2500,1);
        return 1;
}if (!strcmp("/Sweeper", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(574,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Sweeper~n~~h~~w~ID:~h~~r~574",2500,1);
        return 1;
}if (!strcmp("/Broadway", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(575,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Broadway~n~~h~~w~ID:~h~~r~575",2500,1);
        return 1;
}if (!strcmp("/Tornado", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(576,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Tornado~n~~h~~w~ID:~h~~r~576",2500,1);
        return 1;
}if (!strcmp("/AT-400", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(577,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~AT-400~n~~h~~w~ID:~h~~r~577",2500,1);
        return 1;
}if (!strcmp("/DFT-30", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(578,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~DFT-30~n~~h~~w~ID:~h~~r~578",2500,1);
        return 1;
}if (!strcmp("/Huntley", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(579,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Huntley~n~~h~~w~ID:~h~~r~579",2500,1);
        return 1;
}if (!strcmp("/Stafford", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(580,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Stafford~n~~h~~w~ID:~h~~r~580",2500,1);
        return 1;
}if (!strcmp("/BF-400", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(581,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~BF-400~n~~h~~w~ID:~h~~r~581",2500,1);
        return 1;
}if (!strcmp("/Newsvan", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(582,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Newsvan~n~~h~~w~ID:~h~~r~582",2500,1);
        return 1;
}if (!strcmp("/Tug", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(583,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Tug~n~~h~~w~ID:~h~~r~583",2500,1);
        return 1;
}if (!strcmp("/Emperor", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(585,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Emperor~n~~h~~w~ID:~h~~r~585",2500,1);
        return 1;
}if (!strcmp("/Wayfarer", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(586,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Wayfarer~n~~h~~w~ID:~h~~r~586",2500,1);
        return 1;
}if (!strcmp("/Euros", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(587,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Euros~n~~h~~w~ID:~h~~r~587",2500,1);
        return 1;
}if (!strcmp("/Hotdog", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(588,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Hotdog~n~~h~~w~ID:~h~~r~588",2500,1);
        return 1;
}if (!strcmp("/Club", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(589,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Club~n~~h~~w~ID:~h~~r~589",2500,1);
        return 1;
}if (!strcmp("/Andromada", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(592,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Andromada~n~~h~~w~ID:~h~~r~592",2500,1);
        return 1;
}if (!strcmp("/Dodo", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(593,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Dodo~n~~h~~w~ID:~h~~r~593",2500,1);
        return 1;
}if (!strcmp("/RCCam", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(594,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~RC Cam~n~~h~~w~ID:~h~~r~594",2500,1);
        return 1;
}if (!strcmp("/Launch", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(595,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Launch~n~~h~~w~ID:~h~~r~595",2500,1);
        return 1;
}if (!strcmp("/PoliceLS", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(596,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Police LS~n~~h~~w~ID:~h~~r~596",2500,1);
        return 1;
}if (!strcmp("/PoliceSF", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(597,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Police SF~n~~h~~w~ID:~h~~r~597",2500,1);
        return 1;
}if (!strcmp("/PoliceLV", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(598,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Police LV~n~~h~~w~ID:~h~~r~598",2500,1);
        return 1;
}if (!strcmp("/PoliceRanger", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(599,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Police Ranger~n~~h~~w~ID:~h~~r~599",2500,1);
        return 1;
}if (!strcmp("/Picador", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(600,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Picador~n~~h~~w~ID:~h~~r~600",2500,1);
        return 1;
}if (!strcmp("/Swat", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(601,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Swat~n~~h~~w~ID:~h~~r~601",2500,1);
        return 1;
}if (!strcmp("/Alpha", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(602,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Alpha~n~~h~~w~ID:~h~~r~602",2500,1);
        return 1;
}if (!strcmp("/Phoenix", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(603,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Phoenix~n~~h~~w~ID:~h~~r~603",2500,1);
        return 1;
}if (!strcmp("/Glendale2", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(604,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Glendale Shit~n~~h~~w~ID:~h~~r~604",2500,1);
        return 1;
}if (!strcmp("/Sadler2", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(605,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Sadler Shit~n~~h~~w~ID:~h~~r~605",2500,1);
        return 1;
}if (!strcmp("/Boxville2", cmdtext, true))
    {
        if(SpawnedVehicles[playerid] != 0) DestroyVehicle(SpawnedVehicles[playerid]);
        new Float:X,Float:Y,Float:Z,Float:ROT;
        GetPlayerPos(playerid,X,Y,Z);
        GetPlayerFacingAngle (playerid,ROT);
        SpawnedVehicles[playerid] = CreateVehicle(606,X,Y,Z,ROT,-1,-1,60);
        PutPlayerInVehicle(playerid,SpawnedVehicles[playerid],0);
        GameTextForPlayer(playerid,"~h~~w~Boxville 2~n~~h~~w~ID:~h~~r~606",2500,1);
        return 1;
}
        return 1;
}
// === Respawn Things.. === //
public IsVehicleOccupied(vehicleid)
{
   for(new i=0;i<MAX_PLAYERS;i++)
   {
      if(IsPlayerInVehicle(i,vehicleid)) return 1;
   }
   return 1;
}
// ====================== //
public OnPlayerDisconnect(playerid)
{
        DestroyVehicle(SpawnedVehicles[playerid]);
    SpawnedVehicles[playerid] = 0;
    return 0;
}
#endif
