/* user and group to drop privileges to */
static const char *user  = "theo";
static const char *group = "theo";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#282828",     /* after initialization */
	[INPUT] =  "#b16286",   /* during input */
	[FAILED] = "#cc241d",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;
