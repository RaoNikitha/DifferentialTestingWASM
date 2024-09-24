;; 8. Validate a function that includes a `nop` followed by a conditional branch leading to a function call. Ensure the branch executes correctly, the correct function is called, and the intended return value is produced, confirming the `nop` is truly a no-operation.

 ;; (module
  (func $test (result i32)
    nop
    (if (result i32) (i32.const 1)
      (then (call $helper))
    )
  )
  (func $helper (result i32)
    (i32.const 42)
  )
)
(assert_invalid
  (module
    (func $test (result i32)
      nop
      (if (result i32) (i32.const 1)
        (then (call $helper))
      )
    )
    (func $helper (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)