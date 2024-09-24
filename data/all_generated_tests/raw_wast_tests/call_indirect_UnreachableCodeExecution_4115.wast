;; 4. **Incorrect Index Type Handling**:    Test with an `i64` value for the function index in a `call_indirect` instruction instead of `i32`. Ensure the module traps and does not continue execution. Reaching an `unreachable` instruction showcases whether type enforcement is correctly honored.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func (call_indirect (type 0) (i64.const 1)))
  )
  "type mismatch"
)