;; 9. **Test Description**: Perform nested function calls where the parents and child functions have different parameter and return types, and observe the stack's consistency throughout nested invocations.    **Constraint Checked**: Nested calls with type differences.    **Relation to Stack Corruption**: Nested calls magnify improper stack handling, leading to compounded corruption risks.

(assert_invalid
  (module
    (type $parentType (func (param i32) (result i64)))
    (type $childType (func (param i64) (result f32)))
    (func $parent (type $parentType) (param i32) (result i64)
      (i64.const 42)
      (call $child)
    )
    (func $child (type $childType) (param i64) (result f32)
      (f32.const 3.14)
    )
  )
  "type mismatch"
)