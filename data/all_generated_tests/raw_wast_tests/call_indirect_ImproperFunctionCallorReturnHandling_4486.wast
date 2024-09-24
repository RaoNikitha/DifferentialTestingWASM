;; 5. **Test Description**: Utilize `call_indirect` where the indexed function has a different number of return values than expected by `typeidx`, confirming if type mismatch is trapped.    - **Constraint Checked**: Function return type conformity.    - **Relation to Improper Handling**: Prevents improper function returns from mismatched return types.

(assert_invalid
  (module
    (type $expected_type (func (result i32)))
    (type $actual_type (func))
    (func $f (type $actual_type))
    (table funcref (elem $f))
    (func (call_indirect (type $expected_type) (i32.const 0)))
  )
  "type mismatch"
)