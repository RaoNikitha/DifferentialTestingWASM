;; 2. **Function Type Mismatch**:     Define a function type in the module and intentionally create a `call_indirect` instruction with a mismatching function type. Check if the implementations properly trap and validate no stack corruption occurs by asserting the stack state after the trap.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 0 funcref)
    (func $type-mismatch (call_indirect (type 0) (i32.const 1) (i32.const 0)))
  )
  "type mismatch"
)