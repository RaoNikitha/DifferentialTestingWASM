;; 1. **Simple Mismatched Signature Check**:    - Define a table with functions of differing signatures.    - Use `call_indirect` to call a function expecting a mismatched signature.    - Confirm if the OCaml implementation traps due to a pattern match failure, while the Java implementation potentially does not.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32 i32) (result i32)))
    (table funcref (elem 0 1))
    (func $f1 (param i32) (result i32)
      (i32.const 0)
    )
    (func $f2 (param i32 i32) (result i32)
      (i32.add)
    )
    (func $test
      (call_indirect (type 1) (i32.const 0) (i32.const 10) (i32.const 20))
    )
  )
  "type mismatch"
)