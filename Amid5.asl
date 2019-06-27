state("AmidEvil-Win64-Shipping") 
{
	byte Start : "AmidEvil-Win64-Shipping.exe", 0x2BAFFD0;
	byte Loading : "AmidEvil-Win64-Shipping.exe", 0x2E76B0C;
	byte Stats : "AmidEvil-Win64-Shipping.exe", 0x2F5C2F8, 0x188, 0xF8, 0x80, 0x520, 0x264;
	byte Credits : "AmidEvil-Win64-Shipping.exe", 0x2F75010, 0x80, 0x450, 0x48, 0xB4;
}

start
{
	if(current.Start == 0 && old.Start == 2){
		return true;
		}
}

split
{
	if((current.Stats == 1 && old.Stats == 0) && current.Loading != 1){
		return true;
		}
	else if(current.Credits == 1 && old.Credits == 0){
		return true;
		}
}

isLoading
{
	return (current.Loading == 1 || current.Stats == 1);
}