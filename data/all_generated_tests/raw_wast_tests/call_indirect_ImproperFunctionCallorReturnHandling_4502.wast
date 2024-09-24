;; 1. **Test Description**: Define a type with an incorrect sequence of parameter and return types, then use `call_indirect` with a mismatched function type.    **Constraint Checked**: Ensures dynamic type checking catches the mismatch.    **Relation to Improper Handling**: Validates whether the indirect call jumps to the wrong function due to improper type matching.

(assert_invalid
  (module
    (type $correct_type (func (param i32) (result i32)))
    (type $mismatch_type (func (param i32)))
    (table funcref (elem 0))
    (func $test (call_indirect (type $mismatch_type) (i32.const 0) (i32.const 10)))
  )
  "type mismatch"
)