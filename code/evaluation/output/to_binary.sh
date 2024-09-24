#/bin/bash

for file in ./target_bug_guided_code_diff_WebAssembly_wizard_engine_gpt4o/*.wast; do
    wasm-spec -du $file -o ./BIN_target_bug_guided_code_diff_WebAssembly_wizard_engine_gpt4o/$(basename $file).bin.wast
done