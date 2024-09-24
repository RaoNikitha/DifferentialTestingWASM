;; 10. **Block Type as Exclusive Value Type**:     - **Test Description**: Misuse block instructions assuming `blocktype` only accepts a `valtype?` instead of recognizing function types via `typeidx`.    - **Reasoning**: This verifies that implementations correctly interpret `blocktype` beyond just `valtype?` and encompass function type indexing.    - **Constraint checked**: Block Type Specification    - **Relation to CFG**: Ensures the CFG incorporates the broader scope of function types influencing stack and control flows correctly.

(assert_invalid
  (module (type $sig (func (result i32)))
    (func $invalid-block-with-typeidx
      (block (type $sig) (i32.const 1) (br 0))
    )
  )
  "type mismatch"
)