;; 1. **Test Mismatched Nesting Depth Handling**:    - Construct a nested block structure with multiple levels of nested blocks. Include a `br` instruction that targets a label outside the immediate block but within the overall structure. Check for correct unwinding and label resolution for the branch instruction.    - **Constraint**: Ensures that branches resolve to the correct target based on relative label indices. Tests proper label resolution with nested structures.    - **Focus**: The implementation must correctly calculate the nesting depth and relative label indices.

(assert_invalid
  (module (func $nested-block-unwind-depth-i32 (result i32)
    (block (result i32)
      (block
        (block 
          (br 2 (i32.const 42))
        )
        (i32.const 0)
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)