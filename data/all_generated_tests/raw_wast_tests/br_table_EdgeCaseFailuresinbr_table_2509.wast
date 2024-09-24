;; ```  9. **Nested Blocks Mismatch**:    ```plaintext    Implement a `br_table` within nested blocks, ensuring operand stack consistency during inward-directed jumps. This tests nested block handling and error raising when inner block branches are misaligned.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br_table 0 1 (i32.const 2) (local.get 0))
          )
        )
      )
    )
  )
  "type mismatch"
)