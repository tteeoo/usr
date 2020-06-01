//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/	/*Command*/		/*Update Interval*/	/*Update Signal*/
	{" ", "amixer -D pulse sget Master | grep 'Left:' | awk -F'[][]' '{ print $2 }'", 0, 10},
	{"", "date +\"%y.%m.%d %H:%M\"",	60,		0},
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = ' ';
