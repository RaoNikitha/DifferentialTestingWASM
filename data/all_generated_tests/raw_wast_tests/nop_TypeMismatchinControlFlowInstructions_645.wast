;; 6. A test with a `block` that includes `nop` and then exits using a `br` instruction that attempts to pass a value, causing a type mismatch.

(assert_invalid
  (module
    (func (block
      nop
      (br 0 (i32.const 1))
    ))
  )
  "type mismatch"
)