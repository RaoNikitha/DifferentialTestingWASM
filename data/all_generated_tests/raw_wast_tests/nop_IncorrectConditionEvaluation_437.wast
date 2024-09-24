;; Test 8: Construct a function with multiple `nop` instructions followed by a `br_if` statement that depends on the evaluation of function parameters. Confirm the branch works based on parameter values.

(assert_invalid
  (module
    (func $test (param i32) (result i32)
      (nop)
      (nop)
      (br_if 0 (local.get 0))
    )
  )
  "type mismatch"
)