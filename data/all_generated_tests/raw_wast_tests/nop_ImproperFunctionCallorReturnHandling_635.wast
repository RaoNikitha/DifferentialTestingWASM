;; 6. Design a test where a function containing `nop` before a conditional function call is made. Check that the `call` executes correctly based on the condition and verify that `nop` does not affect the conditional execution.

(assert_invalid
  (module
    (func $conditional-call
      (if (i32.const 1) (then (nop) (call $dummy)))
    )
    (func $dummy)
  )
  "type mismatch"
)