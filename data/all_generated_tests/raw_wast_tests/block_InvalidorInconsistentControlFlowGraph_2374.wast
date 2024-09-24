;; 5. **Test Backward Branch from Inner Block**:    - Create a scenario where an inner block contains a backward branch instruction targeting the outer block.    - **Reasoning**: This tests how each implementation handles the backward branching and if the CFG correctly reflects this control flow.    - **Purpose**: Ensures that backward branching from inner to outer blocks is managed correctly.

(assert_invalid
  (module
    (func $backward-branch-inner-to-outer
      (block (result i32)
        (block
          (br 1)
        )
        (i32.const 0)
      )
    )
  )
  "invalid branch target"
)