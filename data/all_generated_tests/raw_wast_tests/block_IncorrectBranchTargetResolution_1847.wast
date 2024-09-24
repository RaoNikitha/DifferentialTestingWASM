;; 8. **Branch Table with Complex Target**:    - Use a `br_table` instruction within a block to dynamically select a target block from multiple nested blocks. Each target block modifies the stack differently. Ensure the correct block's instructions execute and properly manipulated the stack.    - **Constraint**: Correctly resolve dynamic branch targets using `br_table`.    - **Focus**: Tests dynamic branch resolution using indexed tables.

(assert_invalid
  (module (func (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 1) ;; Stack: [1]
            (i32.const 2) ;; Stack: [1, 2]
            (br_table 0 1 2 3 (i32.const 2)) ;; Branch to the 3rd block
          )
          (br 0 (i64.const 1)) ;; This should cause a type mismatch
        )
      )
    )
  ))
  "type mismatch"
)