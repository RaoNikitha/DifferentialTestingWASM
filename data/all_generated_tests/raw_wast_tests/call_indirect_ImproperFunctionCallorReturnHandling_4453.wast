;; 2. **Test Description:** Develop a WebAssembly module where `call_indirect` invokes functions with mismatched types (parameter count/type or return type) to ensure type conformity check triggers a trap.    - **Constraint:** Verifies function type checks at runtime.    - **Improper Handling Relation:** Executing functions with mismatched types can lead to incorrect parameter usage or stack corruption.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i32)))
    (table funcref (elem $func1))
    (func $func1 (type $sig1) (param i32) (result i32) (local.get 0))
    (func (type $sig2)
      (call_indirect (type $sig1) (i32.const 0) (local.get 0))
    )
  )
  "type mismatch"
)