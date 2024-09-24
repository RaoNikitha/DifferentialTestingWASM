;; 1. **Unreachable Code Due to Misindexed Label:**    - Test a `br` instruction targeting a deeply nested label with a misinterpreted label index. This should validate if the `br` correctly references the deepest nested block or jumps incorrectly.    - **Constraint Checked:** Correct relative label indexing.    - **CFG Impact:** The `br` instruction might reference an incorrect block, leading to what should be reachable code becoming unreachable.

(assert_invalid
  (module (func $misindexed-label
    (block (block (block
      (br 3) (i32.const 0)
    )))
  ))
  "unknown label"
)