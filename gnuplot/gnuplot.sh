echo "plotting with gnuplot"

wrkdir=$(pwd)
factor=3

gnuplot << EOF

plot "$wrkdir/filename" u 1:(\$2*factor) w l notitle
pause mouse

EOF


