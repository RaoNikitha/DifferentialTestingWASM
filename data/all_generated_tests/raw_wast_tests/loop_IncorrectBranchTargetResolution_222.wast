;; 3. **Test for Conditional Branches with `br_if`**:    Design a loop with a `br_if` that conditionally branches to an outer loop based on a stack condition, ensuring that it properly targets the loop when the condition is met. This checks the correct resolution of conditional branch targets.

(assert_invalid
  (module 
    (func $test_conditional_br_if (result i32)
      (local i32)
      (loop (result i32)
        (br_if 1 (i32.eqz (local.get 0)))
        (i32.const 1)
      )
      (i32.const 2)
    )
  )
  "type mismatch"
)