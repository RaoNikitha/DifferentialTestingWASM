;; 6. Test a loop with a mixture of `br`, `br_if`, and `br_table` instructions to verify complex branching scenarios. Check for accurate stack unwinding, especially ensuring that operands consumed by `br_table` are correctly restored back onto the stack.

(assert_invalid
  (module
    (func $test-loop
      (loop (param i32) (result i32)
        (i32.const 1)
        (br_if 0)
        (i32.const 2)
        (br_table 0 1)
      )
    )
  )
  "type mismatch"
)