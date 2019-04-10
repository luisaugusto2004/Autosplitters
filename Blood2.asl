// SET YOUR "COMPARE AGAINST" TO (GAME TIME) BY RIGHT CLICKING ON YOUR SPLITS OR YOU WON'T SEE LOADS GETTING PAUSED !!
//
// Should be noted that you should make sure to restart your game
// whenever you change any setting in your layout.
//
// Thanks to:
// Psych0sis - Scripting and finding Memory Addresses
// Jayrude - Helping with lists and dictionary stuff & general KNOWLEDGE 
// King Mamba - Testing it with steam version
// -0- - Suggesting to add Level splitting & make it default over general Episode splitting

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

init
{
	version = modules.First().FileVersionInfo.ProductVersion;

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
}

start
{
	if (settings["Episodes only"]){
		if (current.Level == 0 && current.MenuMaster == 0 && (current.MenuStage == 0 && old.MenuStage == 3)){
			vars.Episodes = new Dictionary<byte, bool>();
				vars.Episodes.Add(1, false);
				vars.Episodes.Add(2, false);
				vars.Episodes.Add(3, false);
				vars.Episodes.Add(4, false);
			return true;
		}
	}
	else if (current.Level == 0 && current.MenuMaster == 0 && (current.MenuStage == 0 && old.MenuStage == 3)){
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
