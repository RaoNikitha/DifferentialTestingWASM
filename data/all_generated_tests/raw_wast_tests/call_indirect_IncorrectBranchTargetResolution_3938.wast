;; 7. **Branch Target Misalignment**:    - Use a `call_indirect` instruction where branch targets are close to each other, but the specified branch target value is incorrect.    - Checks for: Ensuring correct branch target resolution and trapping mechanism for the instruction.

(assert_invalid
  (module
    (type (func (param i32)))
    (table funcref (elem (func)))
    (func (result i32)
      (i32.const 0)
      (block (result i32)
        (call_indirect (type 0) (i32.const 1))
      )
    )
  )
  "type mismatch"
)