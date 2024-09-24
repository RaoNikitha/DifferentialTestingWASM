;; 8. **Empty Function Table Leading to Unreachable**:    - Execute `call_indirect` on an empty function table, ensuring that it traps and follows with hitting an `unreachable` instruction.    - Verifies handling of function table population and the expected trap behavior checking for unreachable code execution.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (table 0 funcref)
    (func (call_indirect (type 0) (i32.const 0)))
  )
  "type mismatch"
)