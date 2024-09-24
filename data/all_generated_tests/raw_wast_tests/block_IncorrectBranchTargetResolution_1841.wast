;; 2. **Test Forward Branch Target**:    - Create a block followed by some code, and within the block, place a `br` instruction targeting the end of the block. Ensure that the branch correctly skips to the end, and the code after the block executes correctly.    - **Constraint**: Branches exiting a block should resume execution properly at the code following the block's `end`.    - **Focus**: Tests resolution of a simple forward branch to the block's end.

(assert_invalid
  (module (func $test-forward-branch-target
    (block (result i32)
      (i32.const 42)
      (br 0)
      (i32.const 100)
    )
    (drop)
  ))
  "type mismatch"
)