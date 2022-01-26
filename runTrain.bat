rem only needed to tee log to screen and file
PATH=C:\cygwin\bin;%PATH%

rem vars that may change
rem model name
set MNAME=RMRR.fire
rem folder name which is used default project name
set MFOLD=RMRR.fire
rem name of docker container being used to test with
set DNAME=tester

rem change to trainer folder so imports work
cd ../deepstack-trainer/

rem run trainer
rem See https://securitycam101.rmrr42.com/2021/12/deepstack-training.html for info about options
python3 train.py --name %MNAME% --exist-ok --dataset-path "../%MFOLD%" 2>&1 | tee %MNAME%.train.out

rem copy best model to MyModels
copy C:\DeepStackWS\deepstack-trainer\train-runs\%MFOLD%\%MNAME%\weights\best.pt C:\DeepStack\MyModels\%MNAME%.pt

rem restart container to pickup new model
docker restart %DNAME%

rem run tests
cd ../deepstack
python3 trainTest.py %MNAME% ../%MFOLD%