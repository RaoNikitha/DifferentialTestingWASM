;; 5. **Test 5: Mixed Function References**:    - **Description**: Include both valid and invalid function references within the same table, using `call_indirect`.    - **Constraint Checked**: Ensures dynamic function resolution handles a mix of valid and invalid entries with accurate type checks.    - **CFG Relation**: Checks CFG's capability to dynamically resolve and differentiate between valid and invalid references, handling traps correctly when necessary.

(assert_invalid
  (module
    (type $valid-func-type (func (param i32) (result i32)))
    (type $invalid-func-type (func (param i32 i32) (result i32)))
    (func $valid-func (type $valid-func-type) (param i32) (result i32)
      local.get 0)
    (func $invalid-func (type $invalid-func-type) (param i32 i32) (result i32)
      i32.const 42)
    (table funcref (elem $valid-func $invalid-func))
    (func $mixed-refs-test
      (i32.const 1) ;; Invalid index due to type mismatch
      (call_indirect (type $valid-func-type) (i32.const 1))
    )
  )
  "type mismatch"
)