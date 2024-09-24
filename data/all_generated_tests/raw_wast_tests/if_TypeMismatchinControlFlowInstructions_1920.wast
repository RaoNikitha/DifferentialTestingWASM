;; 1. **Invalid Type in Then Block**:    - Test having the `then` block output a value of type `i64` when the function signature expects `i32`.    - This checks if the implementation enforces type consistency between the function signature and the actual block outputs.    - **Constraint**: Ensuring `if` block's result type `[i32]` matches the expected output.

(assert_invalid
  (module (func $type-then-value-i64-vs-i32 (result i32)
    (if (result i32) (i32.const 1) (then (i64.const 1)) (else (i32.const 0)))
  ))
  "type mismatch"
)