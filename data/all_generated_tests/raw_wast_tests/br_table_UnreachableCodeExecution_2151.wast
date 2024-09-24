;; 1. **Test Description**: A `br_table` with a single label vector where the operand is within bounds, but the block type does not match the expected type, leading the labels to point to an `unreachable` instruction. This tests for early detection of incorrect type matching before the branch.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (br_table 0 (i32.const 0) (local.get 0))
      )
    )
  )
  "type mismatch"
)