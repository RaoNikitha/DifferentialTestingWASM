;; 6. **Incorrect Function Signature**:     Define a function that returns multiple values but mistakenly provide fewer expected types in the `call_indirect` instruction. Both implementations should trap, and the test should assess if the stack maintains its integrity afterward.

(assert_invalid
  (module
    (type (func (result i32 i64)))
    (table 2 funcref)
    (func $incorrect-function-signature (call_indirect (type 0) (i32.const 1)))
  )
  "type mismatch"
)