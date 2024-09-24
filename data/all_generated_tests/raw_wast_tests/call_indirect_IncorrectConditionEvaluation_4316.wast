;; 5. **Correct Signature with Invalid Context**:    - Use a `call_indirect` instruction where the function type is correct but the table index is out-of-bounds.    - Verify that both implementations trap correctly.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 2 funcref)
    (elem (i32.const 0) func) 
    (func (param i32) (result i32)
      (call_indirect (type $sig) (i32.const 3) (i32.const 1))
    )
  )
  "out of bounds table index"
)