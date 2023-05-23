/* See LICENSE file for copyright and license details. */

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int systraypinning = 0;   /* 0: sloppy systray follows selected monitor, >0: pin systray to monitor X */
static const unsigned int systrayonleft = 0;    /* 0: systray in the right corner, >0: systray on left of status text */
static const unsigned int systrayspacing = 2;   /* systray spacing */
static const int systraypinningfailfirst = 1;   /* 1: if pinning fails, display systray on the first monitor, False: display systray on the last monitor*/
static const int showsystray        = 1;        /* 0 means no systray */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const char *fonts[]          = { "monospace:size=10" };
static const char dmenufont[]       = "monospace:size=10";
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { col_gray3, col_gray1, col_gray2 },
	[SchemeSel]  = { col_gray4, col_cyan,  col_cyan  },
};

/* tagging */
static const char *tags[] = { "1", "2", "3", "4", "5", "6", "7", "8", "9" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       1 << 8,       0,           -1 },
};

/* layout(s) */
static const float mfact     = 0.55; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ "[]=",      tile },    /* first entry is default */
	{ "><>",      NULL },    /* no layout function means floating behavior */
	{ "[M]",      monocle },
};

/* key definitions */
/* Mod1Mask e Alt
 * Mod4Mask e Super_L
 */
#define MODKEY Mod1Mask
#define MODKEY2 Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static const char *dmenucmd[] = { "dmenu_run", "-fn", dmenufont, "-nb", col_gray1, "-nf", col_gray3, "-sb", col_cyan, "-sf", col_gray4, NULL };
static const char *termcmd[]  = { "xterm", NULL };
static const char *midcom[]  = { "xterm", "-e", "mc", NULL };
/*static const char *rofimenupower[]  = { "rofi", "-show", "p", "-modi", "p:/home/italo/Workspace/elshaddai/rofi-power-menu/rofi-power-menu", "-theme", "Paper", "-width", "20", "-lines", "12", NULL };
static const char *rofimenu[]  = { "rofi", "-show", "combi", "-combi-modi", "window,drun,ssh", "-modi", "combi", NULL }; */
static const char *gvim[]  = { "gvim", NULL };
static const char *chrome[]  = { "google-chrome", NULL };
static const char *slock[]  = { "slock", NULL };
static const char *xdotoolfechar[]  = { "xdotool", "key", "alt+F4", NULL };
static const char *xmenu_main[]  = { "/home/italo/Workspace/elshaddai/xmenu/xmenu_main.sh", NULL };
/*static const char *xmenu_power[]  = { "/home/italo/Workspace/elshaddai/xmenu/xmenu_power.sh", NULL };*/
/*static const char *surf[] = { "surf", "duckduckgo.com", NULL };*/

static const Launcher launchers[] = {
  /* command       name to display */
	{ xmenu_main,     "[M]"   },
	{ chrome,         "Go"   },
	{ termcmd,        "Xt"   },
	{ gvim,           "Vim"  },
	{ xdotoolfechar,  "[X]"  },
};

static const Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY|ShiftMask,             XK_Return, spawn,          {.v = termcmd } },
	{ MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	{ MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	{ MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY,                       XK_Return, zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY,                       XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY,                       XK_f,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY,                       XK_m,      setlayout,      {.v = &layouts[2]} },
	{ MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	{ MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	{ MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	TAGKEYS(                        XK_9,                      8)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
  /* Atalhos Italo */
	{ MODKEY2,                      XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY2,                      XK_v,      spawn,          {.v = gvim } },
	{ MODKEY2,                      XK_c,      spawn,          {.v = chrome } },
	{ MODKEY2,                      XK_e,      spawn,          {.v = midcom } },
	{ MODKEY2,                      XK_l,      spawn,          {.v = slock } },
	{ MODKEY2,                      XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ControlMask,           XK_t,      spawn,          {.v = termcmd } },
	{ MODKEY|ControlMask,           XK_l,      spawn,          {.v = slock } },
  { MODKEY|ControlMask,           XK_Right,  view_adjacent,  {.i = +1 } },
	{ MODKEY|ControlMask,           XK_Left,   view_adjacent,  {.i = -1 } },
	{ MODKEY,                       XK_F4,     killclient,     {0} },
	{ MODKEY,                       XK_F1,     spawn,          {.v = xmenu_main } },
	/*{0                    , 0x1008ff11 , spawn          , SHCMD ("amixer sset Master 2%-")},*/ /* Volume - */
	/*{0                    , 0x1008ff12 , spawn          , SHCMD ("amixer sset Master toggle")},*/ /* Volume Mute */
	/*{0                    , 0x1008ff13 , spawn          , SHCMD ("amixer sset Master 2%+")},*/ /* Volume + */
	/*{0                    , 0x1008ffb2 , spawn          , SHCMD ("amixer sset Capture toggle")},*/ /* Mic Mute */
	/*{0                    , 0x1008ff59 , spawn          , SHCMD ("$HOME/.xrandr-toggle")},*/ /* Monitores */

};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
  /* Atalhos Italo */
	/*{ ClkStatusText,        0,              Button1,        spawn,          {.v = xmenu_power } },*/

};

