;; 3. Test returning from a function that includes multiple local variable manipulations and ensure the stack unwinding correctly removes intermediate values. This checks if intermediate stack states are improperly retained in Wizard Engine.

(assert_invalid
  (module
    (func $test_multiple_local_unwind (result i32)
      (local i32)
      (local i32)
      (local.set 0 (i32.const 42))
      (local.set 1 (i32.const 24))
      (i32.add (local.get 0) (local.get 1))
      (return)
      (local.get 0)
    )
  )
  "type mismatch"
)