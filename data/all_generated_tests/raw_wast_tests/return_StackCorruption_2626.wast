;; 5. A test that simulates a forward branch instruction leading to a `return`, ensuring that the operand types handled by the `return` are correctly forwarded and no stack corruption occurs.

(assert_invalid
  (module
    (func $type-forward-branch-to-return (result i32)
      (i32.const 10)
      (br 0)
      (return (i32.const 20))
    )
  )
  "type mismatch"
)