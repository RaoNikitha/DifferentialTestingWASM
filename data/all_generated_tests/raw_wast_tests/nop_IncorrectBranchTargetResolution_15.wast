;; 6. **`nop` in Block with Early Exit**: Include a `nop` instruction before a `br` instruction meant to exit the block early. Test whether the presence of `nop` leads to failure in recognizing the early exit instruction properly.

(assert_invalid
  (module
    (func (block (nop) (br 0)))
  )
  "unreachable code"
)