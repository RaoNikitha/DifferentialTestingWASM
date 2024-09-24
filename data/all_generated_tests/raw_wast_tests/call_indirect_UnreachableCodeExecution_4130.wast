;; 9. **Misaligned Function Signature Leading to Unreachable**:    - Use a `call_indirect` where the function reference in the table is present but with a slightly differing function signature that triggers a trap followed by an `unreachable` instruction.    - Confirms the validator enforces strict type conformity before the program can reach unreachable instructions.

(assert_invalid
  (module
    (type (func (param i32) (result i32))) 
    (type (func (param i32))) 
    (table 1 funcref)
    (elem (i32.const 0) 0)
    (func (result i32)
      (call_indirect (type 1) (i32.const 0))
      unreachable)
  )
  "type mismatch"
)