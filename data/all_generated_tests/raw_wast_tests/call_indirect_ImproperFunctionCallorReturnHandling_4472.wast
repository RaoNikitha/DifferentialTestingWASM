;; 1. Test a `call_indirect` instruction where the function type `typeidx` mismatches the actual function type in the table. Ensure that both OCaml and Java implementations attempt to call the function and verify that the OCaml version traps immediately due to pattern matching failure while Java fails in checking the signature properly.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param f64 i32) (result f64)))
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (call_indirect (type 1) (i32.const 0) (i32.const 42)))
  )
  "type mismatch"
)