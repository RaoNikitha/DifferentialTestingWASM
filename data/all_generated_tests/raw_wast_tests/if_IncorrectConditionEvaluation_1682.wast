;; 3. **Test Nested `if` Instructions**:    - Description: Use nested `if` instructions where each condition is evaluated based on different `i32` operands to execute nested branches.    - Constraint: Ensures both inner and outer `if` conditions are properly evaluated recursively.    - Incorrect Condition Evaluation: Test if a bug in nested condition evaluations in Wizard Engine leads to inconsistent or failed branching.

(assert_invalid
 (module
  (func $nested-if-test (result i32)
   (i32.const 1)
   (if (result i32)
    (i32.const 2)
    (then
     (i32.const 0)
     (if (result i32)
      (i32.const 1)
      (then (i32.const 42))
      (else (i32.const 24))
     )
    )
    (else (i32.const 24))
   )
  )
 )
 "type mismatch"
)