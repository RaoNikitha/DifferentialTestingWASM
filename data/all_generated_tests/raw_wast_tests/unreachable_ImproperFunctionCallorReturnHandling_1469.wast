;; 10. **Test Description:**     - Indirect call within a conditional resulting in `unreachable`, and ensure that the function calling stack collapses with the correct trap behavior.     - This test inspects if call stacks correctly handle and recover from `unreachable` within indirect calls under conditional executions.

(assert_invalid
  (module
    (type $t0 (func))
    (table 1 funcref)
    (elem (i32.const 0) $t0)
    (func $f0 (unreachable))
    (func $f1 (result i32)
      (if (i32.const 1)
        (then (call_indirect (type $t0) (i32.const 0)))
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)