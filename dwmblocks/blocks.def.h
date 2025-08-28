//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	 {"", "/home/cozzycode/dwmblocks/scripts/power.sh", 5, 8},
	 {" ", "/home/cozzycode/dwmblocks/scripts/uptime.sh", 120, 0},
    {"", "/home/cozzycode/dwmblocks/scripts/backlight.sh", 0, 10},
    {"", "/home/cozzycode/dwmblocks/scripts/ram.sh", 10, 0},
    {"", "/home/cozzycode/dwmblocks/scripts/cpu.sh", 10, 0},
    {"", "/home/cozzycode/dwmblocks/scripts/battery.sh", 30, 0},
	 {" ", "/home/cozzycode/dwmblocks/scripts/clock.sh", 60, 0},
};

//sets delimiter between status commands. NULL character ('\0') means no delimiter.
static char delim[] = " | ";
static unsigned int delimLen = 4;
