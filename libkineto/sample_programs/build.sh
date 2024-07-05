#!/bin/bash
# Copyright (c) Meta Platforms, Inc. and affiliates.
# All rights reserved.
#
# This source code is licensed under the BSD-style license found in the
# LICENSE file in the root directory of this source tree.

nvcc -c kineto_playground.cu -o kplay_cu.o

g++ \
  -g3 \
  -O0 \
  kineto_playground.cpp \
  -o main \
  -I/usr/local/cuda/include \
  -I../third_party/fmt/include \
  -I/home/shengfu/local/kineto/libkineto/include \
  -L/usr/local/lib \
  -L/usr/local/cuda/lib64 \
  -lpthread \
  -lcuda \
  -lcudart \
  -fsanitize=thread \
  /home/shengfu/local/kineto/libkineto/build/libkineto.a \
  /usr/local/cuda/lib64/libcupti.so \
  /usr/local/cuda/lib64/libnvperf_host.so \
  kplay_cu.o
