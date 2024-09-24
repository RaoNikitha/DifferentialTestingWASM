;; 5. **Test with Type Mismatched Arguments in `br_table` Targets**:    - **Description**: Construct target functions in `br_table` with argument types mismatching their definitions.    - **Constraint Checked**: Function type consistency.    - **Edge Case Relation**: Tests how different implementations handle type mismatches in edge case target calls.

(assert_invalid
  (module
    (type $functype (func (param i32)))
    (func $target1 (param i32) (param i32))
    (func $target2 (param i32))
    (func (block (br_table 0 1 (i32.const 0)))))
  "type mismatch in br_table target"
)