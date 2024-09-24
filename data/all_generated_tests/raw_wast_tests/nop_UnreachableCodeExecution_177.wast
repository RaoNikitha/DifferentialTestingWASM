;; 8. **Test 8**: Use indirect function calls with tables, followed by `nop` instructions and an `unreachable` to confirm that the right function is called and the unreachable code is not mistakenly executed due to incorrect table indices.

(assert_invalid
  (module
    (type $t0 (func (result i32)))
    (func $f0 (result i32) (i32.const 42))
    (table funcref (elem $f0))
    (func $test (result i32)
      (call_indirect (type $t0) (i32.const 0))
      (nop)
      (unreachable)))
  "type mismatch"
)