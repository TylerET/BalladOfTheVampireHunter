#region xp levels experience

global.game_over = false
global.xp = 0;
var _base_xp_goal = 10;
var _xp_growth_rate = 1.05;
global.xp_goal = _base_xp_goal;
global.level = 1;
global.player_attk = 1;
global.mana_attk = 5;
global.mana = 0;
global.mana_max = 180;
global.isPaused = false;
global.maxHealth = 4;

function set_xp_goal_based_on_level() {
	global.xp_goal = _base_xp_goal * pow(global.level, _xp_growth_rate)
}

#endregion

#region cheatcodes
global.cheatIsInvis = false;
#endregion