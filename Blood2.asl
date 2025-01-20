// SET YOUR "COMPARE AGAINST" TO (GAME TIME) BY RIGHT CLICKING ON YOUR SPLITS OR YOU WON'T SEE LOADS GETTING PAUSED !!
//
// Should be noted that you should make sure to restart your game
// whenever you change any setting in your layout.
// IF YOU ARE RUNNING 1.02 THE SETTING ONLY WORKS WITH 0.74 VERSION OF THE DOSBOX EXE, NO OTHER VERSION!!!
// THE OTHER STATES (Besides NBLOOD) ARE ALL FOR THE DEFAULT STEAM OR GOG VERSIONS ONLY!!!
//
// Thanks to:
// Psych0sis - Scripting and finding Memory Addresses
// Jayrude - Helping with lists and dictionary stuff & general KNOWLEDGE 
// King Mamba - Testing it with steam version
// -0- - Suggesting to add Level splitting & make it default over general Episode splitting

state("Dosbox", "0, 74, 0, 0")
{
	byte Episode : "dosbox.exe", 0x193A1A0, 0x3FD944;
	byte Loading : "dosbox.exe", 0x193A1A0, 0x25B9F7C;
	byte Loading2 : "dosbox.exe", 0x193A1A0, 0x58B8CC;
	byte Loading3 : "dosbox.exe", 0x193A1A0, 0x575148;
	byte MenuMaster : "dosbox.exe", 0x193A1A0, 0x2DAE18;
	byte Credits : "dosbox.exe", 0x193A1A0, 0x25BEDDC;
	byte Level : "dosbox.exe", 0x193A1A0, 0x360452;
	byte MenuStage : "dosbox.exe", 0x193A1A0, 0x426F64;
}

state("Dosbox", "0, 74, 2, 0")
{
	byte Episode : "dosbox.exe", 0x193E370, 0x3FD944;
	byte Loading : "dosbox.exe", 0x193E370, 0x25B9F7C;
	byte Loading2 : "dosbox.exe", 0x193E370, 0x58B8CC;
	byte Loading3 : "dosbox.exe", 0x193E370, 0x575148;
	byte MenuMaster : "dosbox.exe", 0x193E370, 0x2DAE18;
	byte Credits : "dosbox.exe", 0x193E370, 0x25BEDDC;
	byte Level : "dosbox.exe", 0x193E370, 0x360452;
	byte MenuStage : "dosbox.exe", 0x193E370, 0x426F64;
}

state("Dosbox", "0, 73, 0, 0") 
{
	byte Episode : "dosbox.exe", 0x193FD40, 0x3F1944;
	byte Loading : "dosbox.exe", 0x193FD40, 0x25ADF7C;
	byte Loading2 : "dosbox.exe", 0x193FD40, 0x57F8C0;
	byte Loading3 : "dosbox.exe", 0x193FD40, 0x3A33B0;
	byte MenuMaster : "dosbox.exe", 0x193FD40, 0x2CEE18;
	byte Credits : "dosbox.exe", 0x193FD40, 0x25B2DDC;
	byte Level : "dosbox.exe", 0x193FD40, 0x354452;
	byte MenuStage : "dosbox.exe", 0x193FD40, 0x41AF64;
}

state("Dosbox", "1.02")
{
	byte Episode : "dosbox.exe", 0x193A1A0, 0x3456A4;
	byte Loading : "dosbox.exe", 0x193A1A0, 0x56E690;
	byte Loading2 : "dosbox.exe", 0x193A1A0, 0x56E694;
	byte Loading3 : "dosbox.exe", 0x193A1A0, 0x56E698;
	byte MenuMaster : "dosbox.exe", 0x193A1A0, 0x36F425;
	byte Credits : "dosbox.exe", 0x193A1A0, 0x2F4F2C;
	byte Level : "dosbox.exe", 0x193A1A0, 0x2BE3F2;
	byte MenuStage : "dosbox.exe", 0x193A1A0, 0x36F44C;
}

state("nblood", "NBlood")
{
	byte Episode : "nblood.exe", 0x6BE544;
	byte Loading : "nblood.exe", 0x12284BCC;	
	byte Loading2 : "nblood.exe", 0x12284BCC;
	byte Loading3 : "nblood.exe", 0x12284BC8;
	byte MenuMaster : "nblood.exe", 0xA07424;
	byte Credits : "nblood.exe", 0x0E67F80, 0x70;
	byte Level : "nblood.exe", 0x43BCC8;
	byte MenuStage : "nblood.exe", 0xA30670;
}

state("nblood", "NBloodDaus1")
{
	byte Episode : "nblood.exe", 0x635D84;
	byte Loading : "nblood.exe", 0x12284BCC;	
	byte Loading2 : "nblood.exe", 0x12284BCC;
	byte Loading3 : "nblood.exe", 0x12284BC8;
	byte MenuMaster : "nblood.exe", 0x70AF60;
	byte Credits : "nblood.exe", 0x0663830,0x70;
	byte Level : "nblood.exe", 0x63602C;
	byte MenuStage : "nblood.exe", 0x1840C70;
	byte InterMission: "nblood.exe", 0x183D6CC;
}

state("nblood", "NBloodDaus2")
{
    	byte Episode : "nblood.exe", 0x6D28BC;
	byte Loading : "nblood.exe", 0x12284BCC;	
	byte Loading2 : "nblood.exe", 0x12284BCC;
	byte Loading3 : "nblood.exe", 0x12284BC8;
	byte MenuMaster : "nblood.exe", 0x6DC7E0;
	byte Credits : "nblood.exe", 0x06FF590,0x70;
	byte Level : "nblood.exe", 0x6D281C;
	byte MenuStage : "nblood.exe", 0x18D0AA0;
	byte InterMission: "nblood.exe", 0x07054D8, 0xE80, 0x228;
}
state("nblood", "NBloodDaus3")
{
    	byte Episode : "nblood.exe", 0x6EC4A0, 0x10;
    	byte Loading : "nblood.exe", 0x12284BCC;	
	byte Loading2 : "nblood.exe", 0x12284BCC;
	byte Loading3 : "nblood.exe", 0x12284BC8;
    	byte MenuMaster : "nblood.exe", 0x7BCB90;
	byte Credits : "nblood.exe", 0x7126C9;
	byte Level : "nblood.exe", 0x6EC874;
	byte MenuStage : "nblood.exe", 0x18F3DD0;
	byte InterMission: "nblood.exe", 0x18F3D6C;
}

init
{
    if(modules.First().ModuleMemorySize == 305385472){ //origi
        version = "NBlood";
        print("vers: " + version);
    }
    else if(modules.First().ModuleMemorySize == 38912000){ //daus
        version = "NBloodDaus1";
        print("vers: " + version);
    }
    else if(modules.First().ModuleMemorySize == 46006272){ //daus
        version = "NBloodDaus2";
        print("vers: " + version);
    }
    else if(modules.First().ModuleMemorySize == 50069504){ //daus 
        version = "NBloodDaus3";
        print("vers: " + version);
    } else if(settings["1.02"]) {
        version = "1.02";
    }
    else{
	print("vers:" + modules.First().ModuleMemorySize);
	version = modules.First().FileVersionInfo.ProductVersion;
    }
            
    vars.DoneMaps = new List<int>(); // Keeps track of completed levels
    vars.Episodes = new Dictionary<byte, bool>(); // Tracks completed episodes
    vars.Episodes[0] = false;
    vars.Episodes[1] = false;
    vars.Episodes[2] = false;
    vars.Episodes[3] = false;
    vars.Episodes[5] = false;
}

startup
{
    settings.Add("Episodes only", false, "4 Splits for episodes");
    settings.Add("1.02", false, "Using 1.02 version");
}

start
{
    if (current.Level == 0 && (current.MenuStage == 1 && old.MenuStage == 3) || (current.MenuStage == 0 && old.MenuStage == 3)) {
        vars.DoneMaps.Clear();
        vars.Episodes[0] = false;
        vars.Episodes[1] = false;
        vars.Episodes[2] = false;
        vars.Episodes[3] = false;
	vars.Episodes[5] = false;
        return true;
    }
}

split
{
	if (settings["Episodes only"]) {
 		// Split for episodes only
		if (!vars.Episodes[current.Episode] && current.Credits != 0) {
        		vars.Episodes[current.Episode] = true;
        		return true;
        }
    } 
    else {
        // Split for levels
	if (!vars.DoneMaps.Contains(current.Level) && old.Level != current.Level && current.MenuMaster == 0){
	 	if(current.Level != 0){
            		vars.DoneMaps.Add(current.Level);
            		return true;
		}
	}
        // Split at credits if episode not already completed
        if (!vars.Episodes[current.Episode] && current.Credits != 0) {
		vars.Episodes[current.Episode] = true;
	    	vars.DoneMaps.Clear();
            	return true;
        }
    }
}
