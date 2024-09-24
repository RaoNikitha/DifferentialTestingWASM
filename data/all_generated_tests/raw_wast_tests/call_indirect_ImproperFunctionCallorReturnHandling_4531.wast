;; 10. **Incorrect Signature Reading**: Create a WASM module with different function signatures and ensure `call_indirect` calls with different immediate type indexes. This ensures the proper signature reading and enforcement, avoiding incorrect function selection.

(assert_invalid
 (module
  (func $f (param i32) (result i32) (i32.const 0))
  (type $sig1 (func (param i32) (result i32)))
  (type $sig2 (func (param i64) (result i32)))
  (table funcref (elem $f))
  (func $test
    (call_indirect (type $sig2) (i32.const 0) (i64.const 1))
  )
 )
 "type mismatch"
)