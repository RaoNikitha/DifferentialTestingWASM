;; 2. **Test with Default Label Out of Bounds:**    - Description: Create a test with an operand for the `br_table` instruction that is out of the bounds of the provided label vector, forcing it to branch to the default label.    - Constraint Checked: Handling of out-of-bound operand indexing.    - Relates to Unreachable Code Execution: If the default label branch is mishandled or misencoded, it may unintentionally reach the `unreachable` instruction.

(assert_invalid
  (module
    (func $default-label-out-of-bounds
      (block 
        (i32.const 5)
        (br_table 0 1 0)
      )
    )
  )
  "unknown label"
)