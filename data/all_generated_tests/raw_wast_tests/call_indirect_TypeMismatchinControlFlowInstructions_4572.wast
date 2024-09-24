;; 1. **Function Type Mismatch - Simple Function Call**:     - Ensure that the function signature of the called function does not match the expected signature from the `typeidx`.     - **Constraint**: The function type in the table must conform to the expected function type exactly.     - **Test Relation**: Confirms that both implementations will trap if there’s a type mismatch in a simple `call_indirect` operation.

(assert_invalid
  (module
    (type $sig1 (func (param i32 i32)))
    (type $sig2 (func (param i64)))
    (table funcref (elem))
    (func (param i32 i32)
      (call_indirect (type $sig2) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)