package ru.exsoft.likepizza.utils;

import java.util.Random;

public class MathUtills {
    public static int rnd(int min, int max, Random random) {
        max -= min;
        return (int) (random.nextDouble() * ++max) + min;
    }
}
