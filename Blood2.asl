state("Dosbox", "0, 73, 0, 0") 
{
	byte Episode : "dosbox.exe", 0x193FD40, 0x3F1944;
	byte Loading : "dosbox.exe", 0x193FD40, 0x25ADF7C;
	byte Loading2 : "dosbox.exe", 0x193FD40, 0x57F8C0;
	byte Loading3 : "dosbox.exe", 0x193FD40, 0x3A33B0;
	byte MenuMaster : "dosbox.exe", 0x193FD40, 0x2CEE18;
	byte Credits : "dosbox.exe", 0x193FD40, 0x25B2DDC;
}

state("Dosbox", "0, 74, 0, 0")
{
	byte Episode : "dosbox.exe", 0x193A1A0, 0x3FD944;
	byte Loading : "dosbox.exe", 0x193A1A0, 0x25B9F7C;
	byte Loading2 : "dosbox.exe", 0x193A1A0, 0x58B8CC;
	byte Loading3 : "dosbox.exe", 0x193A1A0, 0x575148;
	byte MenuMaster : "dosbox.exe", 0x193A1A0, 0x2DAE18;
	byte Credits : "dosbox.exe", 0x193A1A0, 0x25BEDDC;
}

state("Dosbox", "0, 74, 2, 0")
{
	byte Episode : "dosbox.exe", 0x193E370, 0x3FD944;
	byte Loading : "dosbox.exe", 0x193E370, 0x25B9F7C;
	byte Loading2 : "dosbox.exe", 0x193E370, 0x58B8CC;
	byte Loading3 : "dosbox.exe", 0x193E370, 0x575148;
	byte MenuMaster : "dosbox.exe", 0x193E370, 0x2DAE18;
	byte Credits : "dosbox.exe", 0x193E370, 0x25BEDDC;
}

init
{
	version = modules.First().FileVersionInfo.ProductVersion;

	vars.SplitIndex = 0;
	vars.split = new List<int> {3, 2, 1, 4};
}

startup
{
	settings.Add("E3", false, "Episode 3 Start");
	settings.Add("E1", false, "Episode 1 Start");
}

start
{
	if (settings["E3"]){
		if (current.Episode == 3 && current.MenuMaster == 0 && current.Loading == 1){
			vars.SplitIndex = 0;
			vars.split = new List<int> {3, 2, 1, 4};
			return true;
		}
	}
	else if (settings["E1"]){
		if (current.Episode == 1 && current.MenuMaster == 0 && current.Loading2 == 1){
			vars.SplitIndex = 0;
			vars.split = new List<int> {1, 2, 3, 4};
			return true;
		}
	}
}

split
{
	if (current.Episode == vars.split[vars.SplitIndex] && current.Credits == 1){
		vars.SplitIndex += 1;
		return true;
	}
}

isLoading
{
	return (current.Loading == 1 || current.Loading2 == 1 || current.Loading3 == 1);
}