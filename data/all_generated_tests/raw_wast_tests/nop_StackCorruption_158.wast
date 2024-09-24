;; Test 9: Integrate multiple `nop` instructions into a function making extensive use of `call_indirect`, ensuring the stack's state remains valid and no stack-related errors occur from incorrect context handling.

(assert_invalid
  (module
    (type $t (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (nop) (nop) (i32.const 0))
    (func $caller (param i32) (result i32)
      (nop)
      (call_indirect (type $t) (local.get 0) (i32.const 0))
      (nop)
    )
  )
  "type mismatch"
)