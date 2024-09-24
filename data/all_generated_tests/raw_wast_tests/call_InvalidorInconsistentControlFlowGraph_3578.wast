;; 7. **Function Call in Partially Executed Loop**:    Design a test where a loop containing a function call is executed only partially due to a break condition. This ensures that the CFG appropriately maps and validates calls within loops that might exit early due to external conditions.

(assert_invalid
  (module
    (func $loop_with_call
      (loop $my_loop
        (call $break_condition)
        (br_if $my_loop (i32.const 0))
        (call $do_something)
      )
    )
    (func $break_condition (result i32)
      (i32.const 1)
    )
    (func $do_something (param i32))
  )
  "type mismatch"
)