;; 4. **Unreachable Code Within Blocks**:    - Design a block with branches leading to unreachable code segments, testing if the CFG correctly identifies and processes these paths.    - This test is to compare how each engine identifies and potentially optimizes unreachable code within block scopes.

(assert_invalid
  (module (func $unreachable-code-within-block
    (block (result i32)
      (br 0)
      (unreachable)
      (i32.const 1)
    )
  ))
  "type mismatch"
)