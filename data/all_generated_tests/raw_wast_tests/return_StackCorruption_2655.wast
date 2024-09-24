;; 4. **Test 4: Variably Typed Function Returns**    - Craft a function expecting a multi-type return (e.g., i32, f64) and triggers `return` after adding values of both types on the stack. Ensure the function properly type-checks and unwinds.    - *Related Constraint*: Verifies operand types handled correctly when unwinding to outermost block.

(assert_invalid
  (module
    (func $mixed-return-type (result i32 f64)
      (i32.const 42)
      (f64.const 3.14)
      (return)
    )
  )
  "type mismatch"
)