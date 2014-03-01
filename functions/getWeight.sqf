// Takes NAME and TYPE.  Returns weight in kilograms.
// Max: 35 kg.

_w = 0;

switch (_this select 1) do // type
{
	case "item":
	{
		switch (_this select 0) do // item
		{
			case "gm": { _w = 0.091 };
			case "used_filter": { _w = 0.001 };
			case "gas_mask": { _w = 0.720 };

			default { 0 };
		};
	};
	case "weapon":
	{
		switch (_this select 0) do // weapon
		{
			case "M16A2": { _w = 3.9 };
			case "M16A2GL": { _w = 4.5 };
			case "m16a4": { _w = 3.9 };
			case "M16A4_GL": { _w = 4.5 };
			case "m16a4_acg": { _w = 4.322 };
			case "M16A4_ACG_GL": { _w = 4.922 };
			case "M4A1": { _w = 2.52 };
			case "M4A1_AIM": { _w = 2.855 };
			case "M4A1_RCO_GL": { _w = 3.466 };
			case "M4A1_AIM_SD_CAMO": { _w = 2.855 };
			case "M4A1_HWS_GL": { _w = 3.438 };
			case "M4A1_HWS_GL_CAMO": { _w = 3.438 };
			case "M4A1_HWS_GL_SD_CAMO": { _w = 3.438 };
			case "M4SPR": { _w = 4.5 };
			case "m8_Carbine": { _w = 2.659 };
			case "m8_CarbineGL": { _w = 2.259 };
			case "m8_Compact": { _w = 2.6 }; // Probably lighter, but I don't know how much
			case "m8_Sharpshooter": { _w = 2.79 }; // Probably heavier, but I don't know how much
			case "m8_SAW": { _w = 3 }; // Again, probably heavier
			case "G36A": { _w = 3.63 };
			case "G36K": { _w = 3.30 };
			case "G36C": { _w = 2.82 };
			case "G36_C_SD_Eotech": { _w = 3.138 };
			case "MG36": { _w = 3.83 };
			case "DMR": { _w = 6.582 };

			default { 0 };
		};
	};
	default { throw "Error: argument 2 must be ""weapon"" or ""item""." };
};
_w