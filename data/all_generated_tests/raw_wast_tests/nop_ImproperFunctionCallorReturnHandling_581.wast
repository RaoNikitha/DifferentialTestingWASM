;; 2. Test a sequence of multiple nested function calls where each function contains `nop` instructions before `call` and `return` to verify that `nop` does not impact the control flow or return values in a nested call scenario.

(assert_invalid
  (module
    (func $test (result i32)
      (call $func_a)
      (nop)
      (i32.const 0)
    )
    (func $func_a (result i32)
      (nop)
      (call $func_b)
    )
    (func $func_b (result i32)
      (nop)
      (i32.const 42)
      (return)
      (nop)
    )
  )
  "type mismatch"
)