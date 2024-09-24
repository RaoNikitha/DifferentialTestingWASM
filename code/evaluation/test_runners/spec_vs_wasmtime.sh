#/bin/bash

for file in ./BIN_NO-STR-ASRTS_target_bug_guided_code_diff_WebAssembly_wizard_engine_gpt4o/*.wast; do
    echo "========================"
    echo "==== Running $file ===="
    $HOME/git/research/compilers/whamm/output/tests/interpreters/wasm $file
    spec_code=$?
    wasmtime wast $file
    wasmtime_code=$?

    if [[ $spec_code -ne 0 ]]; then
        echo "INFO: spec interpreter FAIL on $file"
	if [[ $wasmtime_code -ne 0 ]]; then
	    echo "INFO: wasmtime FAIL on $file"
	    echo "TEST_RESULT: NOT differential -----"
	else
	    echo "INFO: wasmtime PASS on $file"
	    echo "TEST_RESULT: IS differential +++++"
	fi
    else
        echo "INFO: spec interpreter PASS on $file"
        if [[ $wasmtime_code -ne 0 ]]; then
            echo "INFO: wasmtime FAIL on $file"
            echo "TEST_RESULT: IS differential +++++"
        else
            echo "INFO: wasmtime PASS on $file"
            echo "TEST_RESULT: NOT differential -----"
        fi
    fi	    
    echo
done
