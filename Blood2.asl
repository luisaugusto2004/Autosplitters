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

state("nblood", "NBloodDaus")
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

init
{
	
	if (modules.First().ModuleMemorySize == 305385472){ //origi
		version = "NBlood";
		print("vers: " + version);
	}
	else if(modules.First().ModuleMemorySize == 38912000) //daus
	{
		version = "NBloodDaus";
		print("vers: " + version);
	}
	else if (settings["1.02"]){
		version = "1.02";
	}
	else{
		print("vers:" + modules.First().ModuleMemorySize);
		version = modules.First().FileVersionInfo.ProductVersion;
	}
	
	vars.SplitIndex = 0;
	vars.split = new List<int> {1, 2, 3, 4, 5, 6, 7, 8, 9};		// Level splits if needed 
	
	vars.Episodes = new Dictionary<byte, bool>();		// will allow for any episode order
        vars.Episodes.Add(0, false);
        vars.Episodes.Add(1, false);
        vars.Episodes.Add(2, false);
        vars.Episodes.Add(3, false);
}

startup
{
	settings.Add("Episodes only", false, "4 Splits for episodes");
	settings.Add("1.02", false, "Running on 1.02 version of game"); 
}

start
{
	if (settings["Episodes only"]){
		if (current.Level == 0 && (current.MenuStage == 1 && old.MenuStage == 3) || (current.MenuStage == 0 && old.MenuStage == 3)){
			vars.Episodes = new Dictionary<byte, bool>();
				vars.Episodes.Add(0, false);
				vars.Episodes.Add(1, false);
				vars.Episodes.Add(2, false);
				vars.Episodes.Add(3, false);
				vars.Episodes.Add(4, false);
			return true;
		}
	}
	else if (current.Level == 0 && (current.MenuStage == 1 && old.MenuStage == 3) || (current.MenuStage == 0 && old.MenuStage == 3)){
			vars.SplitIndex = 0;
			vars.split = new List<int> {1, 2, 3, 4, 5, 6, 7, 8, 9};
			
			vars.Episodes = new Dictionary<byte, bool>();
				vars.Episodes.Add(0, false);
				vars.Episodes.Add(1, false);
				vars.Episodes.Add(2, false);
				vars.Episodes.Add(3, false);
				vars.Episodes.Add(4, false);
			return true;
		}
}

split
{
	if (settings["Episodes only"]){
		if (!vars.Episodes[current.Episode] && current.Credits != 0){
			vars.Episodes[current.Episode] = true;
			return true;
		}
	}
	else if (current.Level == vars.split[vars.SplitIndex] && current.MenuMaster == 0){
			vars.SplitIndex += 1;
			return true;
		}
	else if (!vars.Episodes[current.Episode] && current.Credits != 0){
		vars.Episodes[current.Episode] = true;
		vars.SplitIndex = 0;
		return true;
	}
	else if (settings["1.02"]){
		if (!vars.Episodes[current.Episode] && current.Credits != 0 && current.MenuMaster == 1 && current.MenuStage != 2 && current.MenuStage != 3){
			vars.Episodes[current.Episode] = true;
			vars.SplitIndex = 0;
			return true;
			}
		}
	}

isLoading
{
}
