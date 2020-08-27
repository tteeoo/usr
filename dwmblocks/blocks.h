//Modify this file to change what commands output to your statusbar, and recompile using the make command.
static const Block blocks[] = {
	/*Icon*/ /*Command*/  /*Update Interval*/  /*Update Signal*/
	{ "",    "volume_bar",  0,                   10 },
	{ "",    "cpu_bar",     6,                   0 },
	{ "",    "temp_bar",    6,                   0 },
	{ "",    "time_bar",    60,                  0 },
};

//sets delimeter between status commands. NULL character ('\0') means no delimeter.
static char delim = ' ';
