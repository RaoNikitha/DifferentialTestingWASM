;; 9. **Nested Calls with Unreachable**:    In a function, use `call_indirect` within another function call that leads to an `unreachable` instruction when the nested call parameters do not match required signatures. It tests nested function calling and validation.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func))
    (table 1 funcref)
    (func $nested-call-unreachable
      (unreachable)
      (call_indirect (type 0) (i32.const 0))
    )
    (func
      (call_indirect (type 1) (i32.const 0))
    )
  )
  "type mismatch"
)