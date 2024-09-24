;; 10. **Incorrect Blocktype for Else**:    - Define a blocktype that expects `i32 -> [i32]` but provide instructions in the `else` block that incorrectly return `[]`.    - This checks the type correctness of output values when an `else` branch is taken.    - **Constraint**: The output type of both branches must match the declared blocktype precisely.

(assert_invalid
  (module (func $incorrect-blocktype-for-else (result i32)
    (if (result i32) (i32.const 1)
      (then (i32.const 42))
      (else (nop))
    )
  ))
  "type mismatch"
)