#!/usr/bin/env gnuplot
set xdata time
set timefmt '%s'
set xlabel 'UTC time'
set terminal aqua noenhanced
plot [][0:] datafile using 1:2 with points pt 6 title datafile
