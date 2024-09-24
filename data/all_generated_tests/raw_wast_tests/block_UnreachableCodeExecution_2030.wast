;; 1. **Unreachable in Nested Block**:    - Create a nested block structure with an inner block containing an `unreachable` instruction. Ensure a branch skips over the inner block.    - This test checks if the block label handling correctly skips the `unreachable` code.    - Differential behavior can be observed if mismanagement leads to the `unreachable` instruction being hit erroneously.

(assert_invalid
  (module
    (func $unreachable-in-nested-block
      (block (result i32)
        (block (result i32)
          (unreachable)
        )
        (br 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)