;; 10. Design a function with `nop` at the start and right before a `call_indirect` in a nested block structure, ensuring the nested structure type is correct and the call sequence follows proper scoping rules without any disruption from `nop`.

(assert_invalid
  (module
    (type $t0 (func))
    (table funcref (elem $t0)) 
    (func (block
      (nop)
      (block
        (call_indirect (type $t0) (i32.const 0))
        (nop)
      )
    ))
  )
  "type mismatch"
)