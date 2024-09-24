;; Use a conditional branch `br_if` with a type mismatch function to trigger a trap, ensuring `call_indirect` is correctly identified and execution is halted.

(assert_invalid
  (module
    (type $sig1 (func (param i32)))
    (type $sig2 (func (param i64)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (param i32))
    (func (param i32)
      (block
        (br_if 0 (i32.const 0))
        (call_indirect (type $sig2) (i32.const 0))
      )
    )
  )
  "type mismatch"
)