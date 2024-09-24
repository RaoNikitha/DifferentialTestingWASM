;; 6. Test the scenario where an invalid `typeidx` is provided in the `call_indirect` instruction, assessing if the implementations properly handle type index resolution and associated traps.

(assert_invalid
  (module
    (type $sig (func))
    (type $sig_invalid (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $f)
    (func $f (result i32) (i32.const 42))
    (func (result i32)
      (call_indirect (type $sig_invalid) (i32.const 0))
    )
  )
  "type index out of range"
)