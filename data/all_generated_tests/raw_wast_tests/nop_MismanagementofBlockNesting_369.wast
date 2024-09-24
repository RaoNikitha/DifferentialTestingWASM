;; 10. **Nested `loop` Structures with Inner NOP**: Design multiple nested loops where each nested loop contains a `nop` instruction. Validate execution to ensure correct iteration over each loop without misinterpreting the block depth.

(assert_invalid
  (module
    (func (loop (loop (nop)))))
  "unexpected end of section or function"
)