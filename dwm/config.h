/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 2;        /* border pixel of windows */
static const unsigned int snap      = 8;        /* snap pixel */
static const unsigned int gappx     = 12;       /* gap pixel */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int resizehints        = 0;        /* 1 means respect size hints in tiled resizals */

static const char *fonts[]          = { "Fira Mono:size=10" };
static const char dmenufont[]       = "Fira Mono:size=10";

static const char bg_norm[]         = "#282828";
static const char border_norm[]     = "#928374";
static const char fg_norm[]         = "#ebdbb2";

static const char fg_sel[]          = "#282828";
static const char border_sel[]      = "#83a598";
static const char bg_sel[]          = "#83a598";

static const char *colors[][3]      = {
	/*               fg       bg       border   */
	[SchemeNorm] = { fg_norm, bg_norm, border_norm },
	[SchemeSel]  = { fg_sel,  bg_sel,  border_sel  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5" };

/* layout(s) */
static int oldlayout          = 0;    /* used in togglelayout() */
static const float mfact      = 0.5; /* factor of master area size [0.05..0.95] */
static const int nmaster      = 1;    /* number of clients in master area */
static const Layout layouts[] = {
	/* symbol     arrange function */
	{ tile },    /* first entry is default */
	{ monocle },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-fn", dmenufont, "-nb", bg_norm, "-nf", fg_norm, "-sb", bg_sel, "-sf", fg_sel, NULL };

static Key keys[] = {
	/* modifier                     key        function        argument */
	// mod + m: focus on master client
	{ MODKEY,                       XK_m,      focusmaster,    {0} },
	// mod + space: swap focused client and master's position
	{ MODKEY,                       XK_space,  zoom,           {0} },
	// mod + r: spawn dmenu on the focused monitor
	/* { MODKEY,                       XK_r,      dmenu,          {0} }, */
	// mod + b: toggle the bar for the selected tag(s)
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	// mod + j/k: change focus up/down the stack of clients
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	// mod + shift + j/k: change position of the focused client up/down the stack of clients
	{ MODKEY|ShiftMask,             XK_j,      movestack,      {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_k,      movestack,      {.i = -1 } },
	// mod + i/d: increase/decrease the number of master clients
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	// mod + h/l: increase/decrease the master:stack ratio
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	// mod + g: reset master factor
	{ MODKEY,                       XK_g,      setmfact,       {.f =  1.50} },
	// mod + shift + h/l: increase/decrease the size of a client
	{ MODKEY|ShiftMask,             XK_h,      setcfact,       {.f = +0.25} },
	{ MODKEY|ShiftMask,             XK_l,      setcfact,       {.f = -0.25} },
	// mod + shift + g: reset client factor
	{ MODKEY|ShiftMask,             XK_g,      setcfact,       {.f =  0.00} },
	// mod + w: kill focused client
	{ MODKEY,                       XK_w,      killclient,     {0} },
	// mod + tab: toggle monocle
	{ MODKEY,                       XK_Tab,    togglelayout,   {.i = 1} },
	{ MODKEY|ShiftMask,             XK_Tab,    togglefloating, {0} },
	// mod + t: toggle resizehints
	{ MODKEY,                       XK_t,      toggleresizehints, {0} },
	// mod + number: view tag
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	// mod + shift + number: tag client
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	// mod + ./,: cycle monitor focus
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	// mod + shift + ./,: tag client with other monitor's tag
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	// mod + shift + q: quit dwm
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	// define tag keys
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static Button buttons[] = {
	/* click                event mask      button          function        argument */
	// click (on client): move client
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	// middle click (on client): toggle client floating
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	// right click (on client): resize client
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	// click (on tag): change focused tag
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	// click (on tag): add focused tag
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	// mod + click (on tag): change focused client's tag
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	// mod + right click (on tag): add a new tag to focused client
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

