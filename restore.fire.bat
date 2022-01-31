set PATH=C:\cygwin\bin;%PATH%
c:
cd C:\DeepStackWS\RMRR.fire
rm -fr C:\DeepStackWS\deepstack\train
find ./train -type f -print | cpio -puvmd C:\DeepStackWS\deepstack
rm -fr C:\DeepStackWS\deepstack\test
find ./test -type f -print | cpio -puvmd C:\DeepStackWS\deepstack
rm -fr C:\DeepStackWS\deepstack\debug.pics
find ./debug.pics -type f -print | cpio -puvmd C:\DeepStackWS\deepstack

cp fire.trainTest.log test.cache train.cache C:\DeepStackWS\deepstack

cd C:\DeepStackWS\RMRR.fire\train-runs
cp fire.train.log  C:\DeepStackWS\deepstack-trainer

cd C:\DeepStackWS\RMRR.fire\train-runs
find . -type f -print | cpio -puvmd C:\DeepStackWS\deepstack-trainer\train-runs\deepstack\fire

pause


