;; Use a `nop` instruction between a `call_indirect` instruction and its target-specific setup instructions to verify that `nop` does not disrupt the data setup or function parameter passing for the indirect call.

(assert_invalid
  (module
    (type $t0 (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $t0)
    (func $f0 (type $t0) (param i32) (result i32) (i32.add (local.get 0) (i32.const 1)))
    (func (param i32) (result i32)
      (call_indirect (type $t0)
        (nop)
        (i32.const 0) (local.get 0)))
  )
  "type mismatch"
)