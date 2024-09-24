;; 7. **Test 7 - Inconsistent Types in Conditional Block**:    - Description: Create a conditional block that should produce an integer result, but conditionally inserts a return instruction providing a floating-point type.    - Constraint: Tests the ability of the `return` instruction to enforce type consistency in conditional flows.

(assert_invalid
  (module
    (func $type-inconsistent-in-conditional (result i32)
      (i32.const 1)
      (if (result i32) (then (return (f32.const 0.0))) (else (i32.const 0)))
    )
  )
  "type mismatch"
)