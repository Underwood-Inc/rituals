package com.rituals.config;

/**
 * XP rate presets for the time-based passive soul XP system.
 *
 * <p>The soul grows through observation and existence. These presets
 * control how frequently XP is awarded while a soul weapon sits in
 * the player's hotbar.</p>
 *
 * <ul>
 *   <li><b>EASY</b> — 200 ticks (10 seconds) per cycle</li>
 *   <li><b>MEDIUM</b> — 400 ticks (20 seconds) per cycle</li>
 *   <li><b>HARD</b> — 600 ticks (30 seconds) per cycle (default)</li>
 *   <li><b>CUSTOM</b> — user-specified interval in ticks</li>
 * </ul>
 *
 * <p>Used by {@link RitualsConfig} for config storage, by
 * {@link com.rituals.soul.SoulXpTracker} for pushing resolved values,
 * and by {@link RitualsClothConfigScreen} for the ModMenu UI.</p>
 */
public enum SoulXpRate {

    EASY(200, "Easy (10s)"),
    MEDIUM(400, "Medium (20s)"),
    HARD(600, "Hard (30s)"),
    CUSTOM(-1, "Custom");

    /** Tick interval for this preset, or -1 for CUSTOM (uses user-defined value). */
    public final int ticks;

    /** Human-readable label for config screens. */
    public final String label;

    SoulXpRate(int ticks, String label) {
        this.ticks = ticks;
        this.label = label;
    }

    /**
     * Resolves a TOML string to an enum value (case-insensitive).
     * Returns {@link #HARD} if the string is unrecognized.
     *
     * @param s the TOML string (e.g. "easy", "HARD", "custom")
     * @return the matching enum value, or HARD as default
     */
    public static SoulXpRate fromString(String s) {
        if (s == null || s.isBlank()) {
            return HARD;
        }
        try {
            return valueOf(s.trim().toUpperCase());
        } catch (IllegalArgumentException e) {
            return HARD;
        }
    }

    /**
     * Formats a tick count as a human-readable time string.
     * Examples: "10s", "1m 30s", "5m 0s"
     *
     * @param ticks the tick count (20 ticks = 1 second)
     * @return human-readable time string
     */
    public static String formatTicks(int ticks) {
        int totalSeconds = ticks / 20;
        if (totalSeconds >= 60) {
            int minutes = totalSeconds / 60;
            int remainingSeconds = totalSeconds % 60;
            return minutes + "m " + remainingSeconds + "s";
        }
        return totalSeconds + "s";
    }

    @Override
    public String toString() {
        return label;
    }
}
