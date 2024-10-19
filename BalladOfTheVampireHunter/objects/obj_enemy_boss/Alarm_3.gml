if (hp <= 0) {
	current_mode = BossMode.DeathMode	
} else {


switch (current_mode) {
    case BossMode.MeleeMode:
        // Move to RangeMode or SummoningMode randomly
        current_mode = choose(BossMode.RangeMode, BossMode.SummoningMode);
        break;

    case BossMode.RangeMode:
        // Move to MeleeMode or SummoningMode
        current_mode = choose(BossMode.MeleeMode, BossMode.SummoningMode);
        break;

    case BossMode.SummoningMode:
        // Move to MeleeMode or RangeMode
        current_mode = choose(BossMode.MeleeMode, BossMode.RangeMode);
        break;
}

alarm[3] = random_range(120, 300);
}