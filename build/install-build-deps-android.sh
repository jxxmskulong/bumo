#/bin/bash

cd android/
rm -rf android.zip
wget bumo.chinacloudapp.cn:36002/v8_target/android.zip

down_md5_nums=`md5sum android.zip | cut -d ' ' -f1`
true_md5_nums="db8578e6582a8cc28ba62b676ddfc313"
echo $true_md5_nums
echo $down_md5_nums

if [ "$true_md5_nums"x != "$down_md5_nums"x ]; then  
	echo "$md5_nums error, true md5:" $true_md5_nums "down md5:" $down_md5_nums
	exit
fi

unzip android.zip
rm ../../src/3rd/v8_target/android/ -rf
mv  android ../../src/3rd/v8_target/android -f
rm android.zip -rf
mkdir -p v8_target

cp ../../src/3rd/v8_target/android/* v8_target/
