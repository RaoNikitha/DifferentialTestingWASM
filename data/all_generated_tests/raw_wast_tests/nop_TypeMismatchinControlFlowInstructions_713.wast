;; 4. **Test 4: `nop` within Control Flow with Type Mismatch Else Path**    - Place a `nop` in the `then` section of an `if-else` structure where the `else` section has mismatched operand types.    - **Constraint**: `nop` should not interfere with identifying type mismatches in control paths.    - **Type Mismatch Check**: Ensures type validation between `then` and `else` sections is correctly enforced.

(assert_invalid
  (module 
    (func $test (result i32) 
      (if (i32.const 1) 
        (then (nop) (i32.const 42))
        (else (f64.const 42.0))
      )
    )
  )
  "type mismatch"
)