;; 10. A `loop` that conditionally exits and calls an exported function, which immediately calls back into the original module's outer loop. This checks for proper handling of control flow transitions and context reinstatement after loop exits across exports and imports.  These tests should create scenarios where differences in error handling and stack/context management between WebAssembly and wizard_engine manifest, thereby revealing inconsistencies in how loops are implemented when dealing with control flow across module boundaries.

(assert_invalid
  (module
    (func $exported (export "exportedFunc")
      (call $originalModuleOuterLoop)
    )
    (func $originalModuleOuterLoop
      (loop
        (call $checkConditionAndEitherExitOrExternalCall)
        (br_if 0)
        (call $exported)
        (br 0)
      )
    )
    (func $checkConditionAndEitherExitOrExternalCall
      (i32.const 1)
      (if (result i32)
        (then (i32.const 1)) ; condition true, continue loop
        (else (unreachable)) ; condition false, error handling
      )
    )
  )
  "type mismatch"
)