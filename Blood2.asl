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
	byte Episode : "dosbox.exe", 0x193A1A0, 0x3E0344;
	byte Loading : "dosbox.exe", 0x193A1A0, 0x56E690;
	byte Loading2 : "dosbox.exe", 0x193A1A0, 0x56E694;
	byte Loading3 : "dosbox.exe", 0x193A1A0, 0x56E698;
	byte MenuMaster : "dosbox.exe", 0x193A1A0, 0x2D3F08;
	byte Credits : "dosbox.exe", 0x193A1A0, 0x3EED89C;
	byte Level : "dosbox.exe", 0x193A1A0, 0x359092;
	byte MenuStage : "dosbox.exe", 0x193A1A0, 0x40A0EC;
}

state("nblood", "NBlood")
{
	byte Episode : "nblood.exe", 0xFAD9644;
	byte Loading : "nblood.exe", 0x5A57DC;
	byte Loading2 : "nblood.exe", 0x1020DC12;
	byte Loading3 : "nblood.exe", 0x1020DC2C;
	byte MenuMaster : "nblood.exe", 0xFE20984;
	byte Credits : "nblood.exe", 0xFE1E8A8, 0x2C8, 0x1D8;
	byte Level : "nblood.exe", 0xFE1E446;
	byte MenuStage : "nblood.exe", 0xFE20950;
}

init
{
	if (modules.First().ModuleMemorySize == 271159296){
		version = "NBlood";
	}
	else if (settings["1.02"]){
		version = "1.02";
	}
	else{
		version = modules.First().FileVersionInfo.ProductVersion;
	}
	
	vars.SplitIndex = 0;
	vars.split = new List<int> {1, 2, 3, 4, 5, 6, 7, 8, 9};		// Level splits if needed 
	
	vars.Episodes = new Dictionary<byte, bool>();		// will allow for any episode order
        vars.Episodes.Add(1, false);
        vars.Episodes.Add(2, false);
        vars.Episodes.Add(3, false);
        vars.Episodes.Add(4, false);
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
		if (!vars.Episodes[current.Episode] && current.Credits == 1){
			vars.Episodes[current.Episode] = true;
			return true;
		}
	}
	else if (settings["1.02"]){
		if (current.Level != old.Level)
			return true;
	}
	else if (current.Level == vars.split[vars.SplitIndex] && current.MenuMaster == 0){
			vars.SplitIndex += 1;
			return true;
		}
		else if (!vars.Episodes[current.Episode] && current.Credits == 1){
			vars.Episodes[current.Episode] = true;
			vars.SplitIndex = 0;
			return true;
		}
	}

isLoading
{
	return (current.Loading == 1 || current.Loading2 == 1 || current.Loading3 == 1);
}
