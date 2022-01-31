set PATH=C:\cygwin\bin;%PATH%
c:
cd C:\DeepStackWS\deepstack
rm -fr C:\DeepStackWS\RMRR.fire\train
find ./train -type f -print | cpio -pvumd C:\DeepStackWS\RMRR.fire
rm -fr C:\DeepStackWS\RMRR.fire\test
find ./test -type f -print | cpio -pvumd C:\DeepStackWS\RMRR.fire
rm -fr C:\DeepStackWS\RMRR.fire\debug.pics
find ./debug.pics -type f -print | cpio -pvumd C:\DeepStackWS\RMRR.fire

cp fire.trainTest.log test.cache train.cache C:\DeepStackWS\RMRR.fire

cd C:\DeepStackWS\deepstack-trainer
cp fire.train.log C:\DeepStackWS\RMRR.fire\train-runs

cd C:\DeepStackWS\deepstack-trainer\train-runs\deepstack\fire
find . -type f -print | cpio -pvumd C:\DeepStackWS\RMRR.fire\train-runs

cp C:\DeepStackWS\deepstack-trainer\train-runs\deepstack\fire\weights\best.pt C:\DeepStackWS\RMRR.fire\fire.pt
cp C:\DeepStackWS\RMRR.fire\train\classes.txt C:\DeepStackWS\RMRR.fire\fire_classes.txt

pause


