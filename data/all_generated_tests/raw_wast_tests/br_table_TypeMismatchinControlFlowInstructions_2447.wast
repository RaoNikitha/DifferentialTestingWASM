;; 7. **Incorrect Type Matching with Mixed Operand Types:**    Design `br_table` where its operand stack has mixed types but defaults to a label that only handles a specific type. This tests if operand and block operand types are validated correctly, especially when the stack has mixed types.

(assert_invalid
  (module
    (func
      (block
        (i32.const 1)
        (f32.const 1.0)
        (br_table 0 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)