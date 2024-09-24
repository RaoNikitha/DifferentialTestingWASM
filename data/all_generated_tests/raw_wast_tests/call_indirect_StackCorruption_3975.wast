;; 4. **Test Description**:    Stack underflow scenario where the `call_indirect` instruction is executed without sufficient arguments on the stack. Validate that the stack remains consistent post-trap.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $test (call_indirect (type 0) (i32.const 0)))
  )
  "stack underflow"
)