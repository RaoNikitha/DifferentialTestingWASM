#/bin/bash

for file in ./BIN_NO-STR-ASRTS_target_bug_guided_code_diff_WebAssembly_wizard_engine_gpt4o/*.wast; do
    echo "========================"
    echo "==== Runnning $file ===="
    wasm-spec $file
    spec_code=$?
    wiz-spectest $file
    wiz_code=$?

    if [[ $spec_code -ne 0 ]]; then
        echo "INFO: spec interpreter FAIL on $file"
	if [[ $wiz_code -ne 0 ]]; then
	    echo "INFO: wiz-spec interpreter FAIL on $file"
	    echo "TEST_RESULT: NOT differential -----"
	else
	    echo "INFO: wiz-spec interpreter PASS on $file"
	    echo "TEST_RESULT: IS differential +++++"
	fi
    else
        echo "INFO: spec interpreter PASS on $file"
        if [[ $wiz_code -ne 0 ]]; then
            echo "INFO: wiz-spec interpreter FAIL on $file"
            echo "TEST_RESULT: IS differential +++++"
        else
            echo "INFO: wiz-spec interpreter PASS on $file"
            echo "TEST_RESULT: NOT differential -----"
        fi
    fi	    
    echo
done
