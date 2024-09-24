;; 3. **Test for Operand Stack Underflow within a Loop**:    Set up a `call_indirect` instruction in a loop where the required operands are missing from the stack. If the implementation doesn't trap on the stack underflow, the loop will run indefinitely.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $test
      (loop
        (call_indirect (type 0) (i32.const 0))
      )
    )
  )
  "type mismatch"
)