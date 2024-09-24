;; 6. **Test 6**: Use multiple `call_indirect` instructions with increasing complexity in type mismatches (e.g., argument types mismatch, both argument and return types mismatch) in rapid succession. Determine if differential behavior occurs in error handling, reinforcing boundary condition evaluations.

(assert_invalid
  (module
    (type $sig1 (func (param i32) (result i32)))
    (type $sig2 (func (param f64 i32) (result i32)))
    (type $sig3 (func (param i32 i32) (result f64)))
    (table funcref (elem $f1 $f2 $f3))
    (func $f1 (param i32) (result i32) (i32.const 42))
    (func $f2 (param f64 i32) (result i32) (i32.const 43))
    (func $f3 (param i32 i32) (result f64) (f64.const 44.0))
    (func $complex-mismatch
      (i32.const 0) (call_indirect (type $sig1) (i32.const 0))
      (i32.const 0) (call_indirect (type $sig2) (i32.const 1) (f64.const 1.0) (i32.const 0))
      (i32.const 0) (call_indirect (type $sig3) (i32.const 2) (i32.const 0) (i32.const 1))
    )
  )
  "type mismatch"
)