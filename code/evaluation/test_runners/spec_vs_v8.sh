#/bin/bash

JS_EXT=".wast.bin.wast.js"
for file in $HOME/tmp/JS_NO-STR-ASRTS_target_bug_guided_code_diff_WebAssembly_wizard_engine_gpt4o/*.wast.js; do
    stripped="${file%$JS_EXT}"
    echo "========================"
    echo "==== Running $stripped ===="
    $HOME/git/research/compilers/whamm/output/tests/interpreters/wasm $HOME/tmp/NO-STR-ASRTS_target_bug_guided_code_diff_WebAssembly_wizard_engine_gpt4o/$(basename $stripped).wast
    spec_code=$?
    ./d8 $file
    v8_code=$?

    if [[ $spec_code -ne 0 ]]; then
        echo "INFO: spec interpreter FAIL on $file"
	if [[ $v8_code -ne 0 ]]; then
	    echo "INFO: v8 FAIL on $file"
	    echo "TEST_RESULT: NOT differential -----"
	else
	    echo "INFO: v8 PASS on $file"
	    echo "TEST_RESULT: IS differential +++++"
	fi
    else
        echo "INFO: spec interpreter PASS on $file"
        if [[ $v8_code -ne 0 ]]; then
            echo "INFO: v8 FAIL on $file"
            echo "TEST_RESULT: IS differential +++++"
        else
            echo "INFO: v8 PASS on $file"
            echo "TEST_RESULT: NOT differential -----"
        fi
    fi	    
    echo
done
