#region xp levels experience


global.xp = 0;
var _base_xp_goal = 10;
var _xp_growth_rate = 1.05;
global.xp_goal = _base_xp_goal;
global.level = 1;
global.player_attk = 1;
global.mana = 0;
global.mana_max = 180;
global.isPaused = false;

function set_xp_goal_based_on_level() {
	global.xp_goal = _base_xp_goal * pow(global.level, _xp_growth_rate)
}

#endregion