;; 4. **Test 4**:    - **Description**: Use an `if` block with `call_indirect` to invoke functions from a function table based on dynamic conditions.    - **Constraint**: Ensure that `call_indirect` correctly selects and invokes functions as specified by the indirect table, checking for type consistency.    - **Relation**: Verifies indirect function call handling within `if` blocks and correct return type management.

(assert_invalid
  (module
    (table 1 funcref)
    (type $t_i32 (func (param i32) (result i32)))
    (func $f1 (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (elem (i32.const 0) $f1)
    (func (result i32)
      (if (result i32)
        (i32.const 0)
        (then (call_indirect (type $t_i32) (i32.const 0) (i32.const 2)))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)