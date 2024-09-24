;; 8. **Test Description**: Create nested blocks with varying `blocktype` signatures, including value type and type index mix, ensuring that branch instructions correctly respect the type constraints on stack behavior.    - **Constraint**: Ensure type constraints are respected within nested blocks and branching operations.    - **Nesting Mismanagement Check**: Tests adherence to type constraints and stack correctness for nested block types during branching.

(assert_invalid
  (module (func $nested-blocks-type-index (result i32)
    (block (type 0) (block (result i64) (br 1 (i64.const 5))) (block (result i32) (br 1 (i32.const 5))))
  ))
  "type mismatch"
)