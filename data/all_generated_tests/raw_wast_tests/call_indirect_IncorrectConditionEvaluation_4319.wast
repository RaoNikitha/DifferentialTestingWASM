;; 8. **Dynamic Signature Comparison**:    - During execution, use dynamic function calls where the signature changes before each indirect call.    - Ensure the calls expect different types and check for signature matching and trapping behavior.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param i64) (result i64)))
    (func $f1 (type $sig1) (param i32) (result i32) (local.get 0))
    (func $f2 (type $sig2) (param i64) (result i64) (local.get 0))
    (table 2 funcref)
    (elem (i32.const 0) $f1 $f2)
    (func (block
      (call_indirect (type $sig1) (i32.const 1) (i32.const 42))
    ))
  )
  "type mismatch"
)