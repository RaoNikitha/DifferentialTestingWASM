;; 4. **Multiple Function Types in Table**: Populate the table with multiple functions of different types and ensure `call_indirect` dynamically chooses the correct function based on the provided index.    - **Constraint**: Proper function resolution from diverse types in the table.    - **CFG Relation**: Ensures CFG versatility in handling multiple valid paths when different functions may be called.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param i64)))
    (type $sig3 (func (result i32)))
    (table funcref (elem $f1 $f2 $f3))
    (func $f1 (type $sig1) (param i32))
    (func $f2 (type $sig2) (param i64))
    (func $f3 (type $sig3) (result i32) (i32.const 42))
    (func $test (param i32)
      (call_indirect (type $sig1) (local.get 0))
    )
  )
  "type mismatch"
)