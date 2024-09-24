;; 4. Test an indirect function call sequence (`call_indirect`) with a table lookup followed by `nop` and a `return`, to ensure correct execution flow and that `nop` does not interfere with the indirect call or return mechanism.

(assert_invalid
  (module
    (table 1 funcref)
    (type $t (func))
    (func $f (nop))
    (elem (i32.const 0) $f)
    (func (result i32)
      (call_indirect (type $t) (i32.const 0))
      (nop)
      (return)))
  "type mismatch"
)