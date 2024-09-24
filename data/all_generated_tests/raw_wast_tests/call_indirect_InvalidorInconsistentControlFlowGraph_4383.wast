;; 2. **Test 2: Type Mismatch Trap**:    - **Description**: Define a function type and provide an incorrect function signature in the table, invoking with `call_indirect`.    - **Constraint Checked**: Verifies type conformity between the function type and the required type by `call_indirect`.    - **CFG Relation**: Assesses whether the CFG properly reflects the constraints and triggers a trap on type mismatches.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i64) (result i64)))
    (func (param i32) (result i32)
      (i32.add (local.get 0) (i32.const 1))
    )
    (table funcref (elem 0))
    (func
      (call_indirect (type 1) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)