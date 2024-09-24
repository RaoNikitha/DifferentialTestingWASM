;; 2. Write a test where the main function includes a `nop` before a `call_indirect` that jumps to a function table. Verify that the correct function address is called to ensure `nop` does not interfere with the indirect call type checking or table lookup.

 ;; (module
  (table 1 funcref)
  (type $type-func (func))
  (func $fn0 (type $type-func))
  (elem (i32.const 0) $fn0)
  (func (nop) (call_indirect (type $type-func) (i32.const 0)))
  (start 1)
)

(assert_invalid
  (module
    (table 1 funcref)
    (type $type-func (func))
    (func $fn0 (type $type-func))
    (elem (i32.const 0) $fn0)
    (func (nop) (call_indirect (type $type-func) (i32.const 0)))
  )
  "type mismatch"
)