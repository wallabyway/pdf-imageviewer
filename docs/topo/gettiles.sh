

gettiles () {
mkdir $1; cd $1;
 for (( y=0; y<=$2; y++ )) do
  for (( x=0; x<=$2; x++ )) do
  	curl https://a.tile.opentopomap.org/$(($1-6))/$(($y+$4))/$(($x+$3)).png -o $x-$y.png &
  done;
 done;
cd ..;
}


mkdir 9; cd 9;
curl https://a.tile.opentopomap.org/1/0/0.png -o 0-0.png &
cd ..;

gettiles 10 1 5 3
gettiles 11 3 10 6
gettiles 12 6 20 12
gettiles 13 13 40 24
#gettiles 14 30 80 48
