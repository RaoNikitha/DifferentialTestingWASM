;; Test 6: Invalid Type Index Reference - **Constraint/Issue**: Ensures reference to a non-existing or out of bounds `typeidx`. - **Test Description**: Use `call_indirect` with a `typeidx` that is outside the bounds of the type section array. This should result in a trap due to referencing an invalid type index.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $invalid-typeindex (call_indirect (type 999) (i32.const 0)))
  )
  "unknown type"
)