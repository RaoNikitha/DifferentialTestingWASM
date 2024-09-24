;; 9. **Test Description**: Construct a `br_table` with indices leading to functions that have their intermediate state modified between the `br_table` and the function execution (e.g., globals modified halfway through execution of the table). This checks if such side-effects are properly contained and handled.

(assert_invalid
  (module
    (global $g i32 (i32.const 0))
    (func $modify_global (global.set $g (i32.const 1)))
    (func $test_br_table
      (block $label0
        (br_table $label0 (call $modify_global) (i32.const 1))
        (global.get $g)
        (call 0)
      )
    )
  )
  "type mismatch"
)