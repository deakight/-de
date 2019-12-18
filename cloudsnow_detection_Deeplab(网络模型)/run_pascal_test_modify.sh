#!/bin/sh
## MODIFY PATH for YOUR SETTING
# ROOT_DIR=/home/jh1020/deeplab-v2/data   # dataset path
ROOT_DIR=/home/jh1020
CAFFE_DIR=/home/jh1020/caffe_v3  # caffe path 
CAFFE_BIN=${CAFFE_DIR}/.build_release/tools/caffe.bin

EXP=.

if [ "${EXP}" = "." ]; then
    NUM_LABELS=3
    #DATA_ROOT=${ROOT_DIR}/Landsat8_data_train/
    DATA_ROOT=${ROOT_DIR}/zy3_115_train/
    # NUM_LABELS=21
    #DATA_ROOT=${ROOT_DIR}/dataset
else
    NUM_LABELS=0
    echo "Wrong exp name"
fi

## Specify which model to train
########### voc12 ################
NET_ID=deeplab_largeFOV


## Variables used for weakly or semi-supervisedly training
#TRAIN_SET_SUFFIX=
TRAIN_SET_SUFFIX=_aug

DEV_ID=2
#####

## Create dirs

CONFIG_DIR=${EXP}/config/${NET_ID}
MODEL_DIR=${EXP}/model/${NET_ID}
mkdir -p ${MODEL_DIR}
LOG_DIR=${EXP}/log/${NET_ID}
mkdir -p ${LOG_DIR}
export GLOG_log_dir=${LOG_DIR}

## Run

RUN_TRAIN=0
RUN_TEST=1
RUN_TRAIN2=0
RUN_TEST2=0


## Test #1 specification (on val or test)

if [ ${RUN_TEST} -eq 1 ]; then
    #
    for TEST_SET in val; do
				TEST_ITER=`cat ${EXP}/list/${TEST_SET}.txt | wc -l`
				MODEL=${EXP}/model/${NET_ID}/test.caffemodel
				if [ ! -f ${MODEL} ]; then
				 MODEL=`ls -t ${EXP}/model/${NET_ID}/train_iter_158468.caffemodel | head -n 1`
				 #MODEL=`ls -t /home/jh1020/caffe_v3/voc2012/model/deeplab_largeFOV/train_iter_17784.caffemodel | head -n 1`
				 
             # MODEL=`ls -t /home/train_iter_13.caffemodel | head -n 1`
				fi
				#
				echo Testing net ${EXP}/${NET_ID}
                                # save features documents should change by yourself
                                FEATURE_DIR_1=/home/jh1020/caffe_v3/voc2012_siam_FPM  
                              	FEATURE_DIR=${FEATURE_DIR_1}/features/${NET_ID}
                                # FEATURE_DIR=${EXP}/features/${NET_ID}
				mkdir -p ${FEATURE_DIR}/${TEST_SET}/fc8
                                mkdir -p ${FEATURE_DIR}/${TEST_SET}/fc9
				mkdir -p ${FEATURE_DIR}/${TEST_SET}/seg_score
				sed "$(eval echo $(cat sub.sed))" \
						${CONFIG_DIR}/test.prototxt > ${CONFIG_DIR}/test_${TEST_SET}.prototxt
				CMD="${CAFFE_BIN} test \
             --model=${CONFIG_DIR}/test_${TEST_SET}.prototxt \
             --weights=${MODEL} \
             --gpu=${DEV_ID} \
             --iterations=${TEST_ITER}"
				echo Running ${CMD} && ${CMD}
    done
fi
