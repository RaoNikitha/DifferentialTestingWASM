;; Place multiple `nop` instructions sequentially before a `call_indirect` instruction and check if the indirect function call still correctly jumps to the intended function based on the table lookup.

(assert_invalid
  (module
    (table 1 funcref)
    (func $fn (result i32) (i32.const 42))
    (elem (i32.const 0) $fn)
    (func $caller
      nop
      nop
      nop
      nop
      (call_indirect (type $type-i32) (i32.const 0))
    )
    (type $type-i32 (func (result i32)))
  )
  "type mismatch"
)