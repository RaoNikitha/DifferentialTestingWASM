;; Test Description 6: Execute a function that modifies global variables and relies on the correct state of the stack. Verify if the expected changes in global variables occur without causing stack corruption. Different outcomes can indicate improper stack management leading to state inconsistencies.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 0))
    (func $modify-global (result i32)
      (global.set $g (i32.add (global.get $g) (i32.const 1)))
      (i32.const 0)
    )
    (func $check-global (result i32)
      (global.get $g)
    )
    (func $call-modify-check
      (call $modify-global)
      (call $check-global)
      (i32.eq (i32.const 1)) ;; Ensures global is modified correctly
      (if (then unreachable))
    )
    (func)
  )
  "global type mismatch"
)