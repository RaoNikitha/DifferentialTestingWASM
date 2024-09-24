#!/bin/bash

IN_DIR="../../data/all_generated_tests/BIN_no_assert_str_wast_tests"

for file in $IN_DIR/*.wast; do
  echo "========================"
  echo "==== Running $file ===="
  wasm-spec $file
  spec_code=$?
  wizeng $file
  wiz_code=$?

  if [[ $spec_code -ne 0 ]]; then
      echo "INFO: spec interpreter FAIL on $file"
    if [[ $wiz_code -ne 0 ]]; then
      echo "INFO: wiz-spec-interpreter FAIL on $file"
      echo "TEST_RESULT: NOT differential -----"
    else
      echo "INFO: wiz-spec-interpreter PASS on $file"
      echo "TEST_RESULT: IS differential +++++"
    fi
  else
    echo "INFO: spec interpreter PASS on $file"
    if [[ $wiz_code -ne 0 ]]; then
      echo "INFO: wiz-spec-interpreter FAIL on $file"
      echo "TEST_RESULT: IS differential +++++"
    else
      echo "INFO: wiz-spec-interpreter PASS on $file"
      echo "TEST_RESULT: NOT differential -----"
    fi
  fi
  echo
done
