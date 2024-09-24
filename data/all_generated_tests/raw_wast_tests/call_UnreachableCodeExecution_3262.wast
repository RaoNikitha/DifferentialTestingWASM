;; Test 1: Create a function that branches to an 'unreachable' instruction based on a conditional involving a function call's return value. Verify the behavior when the condition is unexpectedly met.

(assert_invalid
  (module
    (func $conditional-unreachable (result i32)
      (call $check-value (i32.const 10))
      (if (i32.eqz (local.get 0))
        (then (unreachable))
      )
      (i32.const 20)
    )
    (func $check-value (param i32) (result i32)
      (local.get 0)
    )
  )
  "conditional branch to unreachable"
)