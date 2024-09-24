;; 7. Write a function with conditional calls to another function containing `unreachable`. Test if controls reaching `unreachable` via different condition outcomes correctly trap the code execution.

(assert_invalid
  (module
    (func $unreachable_test_conditional
      (if (i32.const 1) (then (call $cause_trap)))
      (if (i32.const 0) (then (call $cause_trap)))
      (unreachable)
    )
    (func $cause_trap
      (unreachable)
    )
  )
  "type mismatch"
)