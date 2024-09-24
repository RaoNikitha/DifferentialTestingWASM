;; Test 9: Multiple Tables and Incorrect Table Index - **Constraint/Issue**: Complexity with multiple tables and incorrect table reference. - **Test Description**: Define multiple tables and use `call_indirect` with a `tableidx` that does not exist or refers to a wrong type of table. The call should trap due to invalid table index reference.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 1 funcref)
    (table 0 funcref)
    (func $test (call_indirect (type 0) (table 2) (i32.const 0)))
  )
  "unknown table"
)