;; 6. **Type Mismatch Target Resolution Test**:    - Craft blocks with different operand types and use the `br` instruction to branch to a block with a mismatched type configuration. Ensure that the `br` instruction correctly handles or fails the branch due to type inconsistencies, confirming correct label indexing with various operand types.

(assert_invalid
  (module
    (func $type-mismatch-target-resolution
      (block (result i32)
        (i64.const 0)
        (br 0)
      )
    )
  )
  "type mismatch"
)