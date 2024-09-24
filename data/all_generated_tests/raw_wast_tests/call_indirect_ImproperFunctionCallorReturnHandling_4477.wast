;; 6. Test an edge case where an operand type sequence `[t_1*]` is polymorphic (allowing multiple types) and see if inconsistent pattern matching in OCaml vs. type checking in Java (`checkSignature`) leads to different traps, confirming improper handling of polymorphic cases.

(assert_invalid
  (module
    (type (func (param i32 i32) (param i32)))
    (table funcref)
    (func $polymorphic-case
      (block (result i32)
        (call_indirect (type 0) (i32.const 1) (f32.const 0.0))
      )
    )
  )
  "type mismatch"
)