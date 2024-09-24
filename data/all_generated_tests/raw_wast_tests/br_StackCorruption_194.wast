;; 5. **High Nesting with Forward Branches:**    Create highly nested blocks and use forward branches that cross multiple nested layers. Verify if the operand stack is correctly managed and restored post-branch in each block to check for stack mismanagement in each implementation.

(assert_invalid
  (module
    (func $high-nesting-forward-branch
      (block $outer (result i32)
        (i32.const 0)
        (block $middle (result i32)
          (i32.const 1)
          (block $inner (result i32)
            (i32.const 2)
            (br 2)
          )
        )
      )
      (drop)
    )
  )
  "type mismatch"
)