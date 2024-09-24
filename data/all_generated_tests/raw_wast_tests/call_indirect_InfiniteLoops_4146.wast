;; 5. **Test Description 5**:    - Design a `call_indirect` instruction in a `loop` where the index operand is constantly invalid (negative or non-integer). The loop should ideally trap, but the erroneous operand handling leads to infinite iteration.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem))
    (func (loop 
      (call_indirect (type 0) (i32.const -1))
      (br 0)
    ))
  )
  "type mismatch"
)