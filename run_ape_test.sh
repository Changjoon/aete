PKGNAME=$1
MINUTES=$2

pidcat ${PKGNAME} > /${OUTDIR}/ape_test_${PKGNAME}.log &
adb shell screenrecord /sdcard/ape_test_${PKGNAME}.mp4 &

python3 ${HOME}/ape/install.py
python3 ${HOME}/ape/ape.py -p ${PKGNAME} --running-minutes ${MINUTES} -v --monitor-native-crashes --kill-process-after-error --bugreport --throttle 100 --ape sata

adb pull /sdcard/ape_test_${PKGNAME}.mp4
adb shell "find /sdcard/ -iname 'app_crash${PKGNAME}_*.txt'" | xargs -n1 adb pull
adb shell "find /sdcard/ -iname 'sata-${PKGNAME}-*'" | xargs -n1 adb pull

adb shell "find /sdcard/ -iname 'ape_test_${PKGNAME}*' | xargs -n1 rm -rf"
adb shell "find /sdcard/ -iname 'app_crash${PKGNAME}_*.txt' | xargs -n1 rm -rf"
adb shell "find /sdcard/ -iname 'sata-${PKGNAME}-*' | xargs -n1 rm -rf"
