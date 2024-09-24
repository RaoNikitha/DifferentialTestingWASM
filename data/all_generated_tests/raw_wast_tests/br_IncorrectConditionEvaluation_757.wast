;; Test 8: Implement a function that uses a `br_if` within an `if` block where the condition checks if an integer is a multiple of another integer. Use values to ensure branching happens only when the condition is truly met, confirming correct multiple condition evaluation.

(assert_invalid
  (module 
    (func $test-multiple-conditions
      (i32.const 8) (i32.const 4)
      (if (result i32)
        (then
          (br_if 0 (i32.rem_u (i32.const 2) (i32.const 0)))
        )
      )
    )
  )
  "type mismatch"
)