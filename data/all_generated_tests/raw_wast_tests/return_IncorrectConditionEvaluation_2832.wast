;; 1. Create a function that immediately returns a value based on a conditional `br_if` using a constant zero. Ensure the branch should not be taken, but check if the function always returns early in one implementation.

(assert_invalid
  (module
    (func $test_br_if_return (result i32)
      (i32.const 0)
      (br_if 0 (i32.const 0))
      (return (i32.const 42))
    )
  )
  "type mismatch"
)