;; 7. Develop a function `f5` with type `[] -> []`, place it in the table but use `call_indirect` to call it with type `i32 -> i32`. The improper use of operands should result in a differential trap detection due to type mismatch in control flow.

(assert_invalid
  (module
    (type $t0 (func (param i32) (result i32)))
    (type $t1 (func))
    (func $f5 (type $t1))
    (table funcref (elem $f5))
    (func
      (i32.const 0)
      (call_indirect (type $t0) (i32.const 0))
    )
  )
  "type mismatch"
)