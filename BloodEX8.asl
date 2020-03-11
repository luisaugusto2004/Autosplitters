state("anuket_x64")
{
	byte LevelTransition : "anuket_x64.exe", 0x675F50;
	byte Credits : "anuket_x64.exe", 0x4FC132;
	byte Episode : "anuket_x64.exe", 0x4FD120;
	byte Level : "anuket_x64.exe", 0x4FA3A8, 0x3;
	byte Savinglol : "anuket_x64.exe", 0x5BB800;
}

init
{
	vars.Episodes = new Dictionary<byte, bool>();		// will allow for any episode order
        vars.Episodes.Add(0, false);
        vars.Episodes.Add(1, false);
        vars.Episodes.Add(2, false);
        vars.Episodes.Add(3, false);
		
	vars.SplitIndex = 0;
	vars.split = new List<int> {50, 51, 52, 53, 54, 55, 56, 57};		// Level splits if needed 
}

start
{
	if (current.Level == 49 && (current.LevelTransition != old.LevelTransition)){
		vars.Episodes = new Dictionary<byte, bool>();
			vars.Episodes.Add(0, false);
			vars.Episodes.Add(1, false);
			vars.Episodes.Add(2, false);
			vars.Episodes.Add(3, false);
		
		vars.SplitIndex = 0;
		vars.split = new List<int> {50, 51, 52, 53, 54, 55, 56, 57};
		return true;
	}
}

split
{
	if (current.Level == vars.split[vars.SplitIndex]){
		vars.SplitIndex += 1;
		return true;
	}
	else if (!vars.Episodes[current.Episode] && current.Credits == 134){
			vars.Episodes[current.Episode] = true;
			vars.SplitIndex = 0;
			return true;
	}
}

isLoading
{
	return (current.Savinglol == 1);
}