;; 7. **Test Description**: Develop a scenario where a loop makes a `call` to a function modifying a global state. Ensure return values from this function reflect correct global state alterations across iterations.    **Constraint Checked**: Function calls modifying global state and returning correct values within loops.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify_global (result i32)
      global.get $g
      i32.const 1
      i32.add
      global.set $g
      global.get $g)
    (func $test_loop
      (loop (result i32)
        call $modify_global
        br_if 0
      )
    )
  )
  "type mismatch"
)