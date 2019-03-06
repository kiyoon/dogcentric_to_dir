
if [ $# -lt 1 ]
then
	echo "Usage: $0 [dogcentric_dir]"
	exit 1
fi

dataset_dir=$1
find "$dataset_dir" -name "*.tar.gz" | xargs -i tar xzf {} -C "$dataset_dir"
rm -rf "$dataset_dir/Hime/"
rm -rf "$dataset_dir/Ringo/"
rm -rf "$dataset_dir/Ryu/"
rm -rf "$dataset_dir/Ku/"

# fix glitches
rm -rf "$dataset_dir/Turn_Right/"		# Same as Look_at_Right but less samples.
find "$dataset_dir" -name "Thumbs.db" | xargs -i rm {}
find "$dataset_dir" -name "info.txt" | xargs -i rm {}
rm -rf "$dataset_dir/Shake/Shake_Ku_1_1300_1390/"
mv "$dataset_dir/Shake/Shake__Ku_8_1100_1230.avi" "$dataset_dir/Shake/Shake_Ku_8_1100_1230.avi"
