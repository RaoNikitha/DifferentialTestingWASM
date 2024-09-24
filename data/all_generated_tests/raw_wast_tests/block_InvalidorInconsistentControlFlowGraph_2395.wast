;; 6. **Test mixed `typeidx` and `valtype?` usage within the blocks to spot incorrect stack operations**:    - **Constraint Checked**: Checks both block type interpretations and their stack operations.    - **Reasoning**: Different type usages within block instructions may lead to stack inconsistencies, affecting CFG.

(assert_invalid
  (module (func $mixed-type-usage (result i32)
    (block (result i32)
      (block (type 0) (br 1 (i32.const 10))) (br 0 (i32.const 20))
    )
  ))
  "type mismatch"
)