;; 3. **Indirect Function Call with Incorrect Signature**:    Use the `call_indirect` instruction to call functions with an incorrect signature intentionally. This should test whether the implementation correctly checks the function signature and produces the correct return values or errors.

(assert_invalid
  (module
    (type $sig (func (param i32) (result i32)))
    (table 1 funcref)
    (elem (i32.const 0) $type-value-indirect-call)
    (func $type-value-indirect-call (param i32) (result i32)
      (i32.const 0)
    )
    (func (result f32)
      (call_indirect (type $sig) (i32.const 0) (i32.const 0))
    )
  )
  "type mismatch"
)