;; 7. Create a function table where one function indirectly called has an unreachable branch label, then use `call_indirect` to invoke it. This examines if a mismatch in function type resolution catches the incorrect branch target effectively.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (type $wrong_sig (func (param i32)))
    (func $f (unreachable))
    (table funcref (elem $f))
    (func $call_unreachable
      (i32.const 0)
      (call_indirect (type $sig) (i32.const 0))
    )
  )
  "type mismatch"
)