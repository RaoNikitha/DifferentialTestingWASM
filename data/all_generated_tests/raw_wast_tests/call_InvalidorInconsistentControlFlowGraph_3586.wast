;; 5. **Unreachable Code Path**:    - **Test Description**: Place a call instruction inside an unreachable block and verify it does not get executed.    - **Constraint Checked**: Proper handling of unreachable code blocks.    - **CFG Relevance**: Confirms control flow correctly excludes unreachable paths, maintaining a correct CFG structure.

(assert_invalid
  (module
    (func $unreachable-call
      (block
        (unreachable)
        (call 0)
      )
    )
    (func (result i32)
      (i32.const 0)
    )
  )
  "unreachable code"
)