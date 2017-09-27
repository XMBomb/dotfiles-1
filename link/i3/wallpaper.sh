mv *.png *.jpg *.jpeg *.gif old
curl -A "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/59.0.3071.115 Safari/537.36" -s "https://www.reddit.com/r/MinimalWallpaper+Offensive_Wallpapers+WQHD_Wallpaper+nocontext_wallpapers+topwalls+ultrahdwallpapers+wallpaper+wallpaperdump+wallpapers/top/?sort=top&t=day" \
  | tr '"' '\n' | grep imgur | tee "$$.tmp" \
  | egrep '^https?://i\.imgur\.com/' \
  | xargs wget -q -nc
egrep '^http://imgur.com/a/' "$$.tmp" \
  | xargs -l1 ./imgur_album_download.sh
rm "$$.tmp"
rename 's/(.*)\?[0-9]/$1/g' *
rename 's/\)//g' *
