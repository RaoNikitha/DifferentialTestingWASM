;; 3. **Mismatched Operand Type Lengths**    - Use multiple target labels with varying operand type lengths, leading to a situation where a type mismatch is expected. This test checks if the `br_table` implementation correctly catches this error and responds with a proper diagnostic message.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result i32 i32)
        (br_table 0 1 (i32.const 0))
      )
    )
  ))
  "type mismatch"
)