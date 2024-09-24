;; 4. **Exported Function Returning to Loop**:    - **Description**: Compile a WebAssembly module (A) with a `loop` that terminates by calling an exported function. This function in turn calls an imported function from module B. Check if returning control correctly resumes the loop in module A.    - **Constraint**: Verify that the stack state and control flow are preserved when transitioning back to the loop after exporting and importing functions.

(assert_invalid
  (module
    (import "moduleB" "funcB" (func $funcB))
    (func $type-loop-call-import (result i32)
      (loop (result i32)
        (call $funcB)
        (br 0)
      )
    )
    (export "funcA" (func $type-loop-call-import))
  )
  "type mismatch"
)