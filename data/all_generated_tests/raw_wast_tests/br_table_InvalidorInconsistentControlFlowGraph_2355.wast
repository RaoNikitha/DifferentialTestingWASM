;; 5. **Test 5 - Mismatched Block Type for Loop Backward Branch**:    Include a backward branch in a `br_table` that incorrectly attempts to branch to a loop with mismatched input block type. The CFG should correctly handle the loop structure and raise an error if types do not match.

(assert_invalid
  (module
    (func $mismatched-loop-backward-branch
      (block
        (loop (result i32)
          (i32.const 0)
          (br_table 1 0 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)