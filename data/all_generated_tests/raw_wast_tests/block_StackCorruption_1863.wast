;; 4. **Test Description**:    Design a block that consumes multiple values from the stack, yet only one value is available initially. Verify the handling of stack underflow conditions, where different implementations might corrupt the stack by mismanaging the balance between expected and available values.

(assert_invalid
  (module (func $test-stack-underflow
    (block (block (result i32 i32) 
      (i32.const 1) ; pushing only one value onto the stack
      (br 1) ; expecting two values when branching
    ))
  ))
  "type mismatch"
)