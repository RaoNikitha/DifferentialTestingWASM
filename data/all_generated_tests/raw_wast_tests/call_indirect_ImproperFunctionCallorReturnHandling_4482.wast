;; 1. **Test Description**: Provide a table with mixed function types and specify a `call_indirect` using an index that references a function of a different type than the `typeidx`. This tests if the implementation correctly traps on type mismatch due to improper function call verification.    - **Constraint Checked**: Function type conformity.    - **Relation to Improper Handling**: Ensures the `call_indirect` does not jump to a function with an incompatible signature.

(assert_invalid
  (module
    (type (func (param i32)))
    (type (func (param i64)))
    (table 2 funcref)
    (elem (i32.const 0) (ref.func 1))
    (func (type 1) (i64.const 42))
    (func (call_indirect (type 0) (i32.const 0) (nop)))
  )
  "type mismatch"
)