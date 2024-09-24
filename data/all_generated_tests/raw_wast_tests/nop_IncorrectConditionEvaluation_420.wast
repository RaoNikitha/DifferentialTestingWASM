;; 1. Create a function with a conditional branch that checks a value after several `nop` instructions. Verify if `br_if` correctly branches based on the value.

(assert_invalid
  (module
    (func $test_func
      (i32.const 1)
      nop
      nop
      nop
      (br_if 0 (i32.eqz (i32.const 0)))
    )
  )
  "type mismatch"
)