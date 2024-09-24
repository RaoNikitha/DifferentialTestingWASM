;; 8. **Return with Incorrect Block Targeting**:    - Construct a function with multiple nested blocks where the return instruction might mistakenly target an intermediate block instead of the outermost one. This tests the CFG’s accuracy in targeting the correct exit block.

(assert_invalid
  (module
    (func $incorrect-block-targeting
      (block
        (block
          (return)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)