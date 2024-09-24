;; - Test 9: Create a loop that involves multiple `local` variable updates and check the operand stack for these updates. Use `br` to loop back while the stack still contains intermediate values. Watch for stack corruption caused by local variable mismanagement.

(assert_invalid
  (module
    (func $test_loop_stack_management
      (local i32)
      (local f64)
      (i32.const 0)
      (f64.const 0.0)
      (loop $loop (result i32 f64)
        (local.set 0)
        (local.set 1)
        (local.get 0)
        (i32.eqz)
        (br_if 1)
      )
    )
  )
  "type mismatch"
)