;; 6. Place a `nop` instruction before a conditional `drop` and subsequent `br_if` instruction inside a function. Test that the condition on which `drop` and `br_if` rely remains correctly evaluated and executed.

(assert_invalid
  (module
    (func (block $label
      (nop)
      (i32.const 1)
      (i32.eqz)
      (drop)
      (br_if $label (i32.const 0))
    ))
  )
  "type mismatch"
)