state("AmidEvil-Win64-Shipping") 
{
	byte Start : "AmidEvil-Win64-Shipping.exe", 0x2BAFFD0;
	byte Loading : "AmidEvil-Win64-Shipping.exe", 0x2E76B0C;
	byte Stats : "AmidEvil-Win64-Shipping.exe", 0x2F5C2F8, 0x188, 0xF8, 0x80, 0x520, 0x264;
	byte Credits : "AmidEvil-Win64-Shipping.exe", 0x2F75010, 0x80, 0x450, 0x48, 0xB4;
	byte EndLevel : "AmidEvil-Win64-Shipping.exe", 0x2E911F4;
	byte MenuStage : "AmidEvil-Win64-Shipping.exe", 0x2F75F14;
	byte Paused : "AmidEvil-Win64-Shipping.exe", 0x2B95A68;
}

state("AmidEvil-Win64-Shipping", "steam") 
{
	byte Start : "AmidEvil-Win64-Shipping.exe", 0x2BB3470;
	byte Loading : "AmidEvil-Win64-Shipping.exe", 0x2B7DDD4;
	byte MenuStage : "AmidEvil-Win64-Shipping.exe", 0x2F79424;
	byte Paused : "AmidEvil-Win64-Shipping.exe", 0x2B98F08;
}

startup
{
	settings.Add("Episodes", false, "Episode Runs");
	settings.Add("Steam", false, "Playing Build 2012");
}

init
{
	if(settings["Steam"]){
		version = "steam";
	}
}

start
{
	if(settings["Episodes"]){
		if(current.Loading == 0 && old.Loading == 1){
			return true;
		}
	}
	
	else if(current.Start == 0 && old.Start == 2){
		return true;
		}
}

split
{
	if((current.MenuStage == 3 && old.MenuStage == 2) && current.Paused != 28 && current.Paused != 3){
		return true;
		}
}

isLoading
{
	return (current.Loading == 1 || (current.MenuStage == 3 && current.Paused == 4)); 
}
