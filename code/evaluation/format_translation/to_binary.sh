#!/bin/bash

IN_DIR="../../data/all_generated_tests/no_assert_str_wast_tests"
OUT_DIR="../../data/all_generated_tests/BIN_no_assert_str_wast_tests"
mkdir -p $OUT_DIR

for file in $IN_DIR/*.wast; do
    wasm-spec -du $file -o $OUT_DIR/$(basename $file).bin.wast
done
