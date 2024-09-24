;; 9. **Unrelated Branch Targets in Execution Flow**:    - Use a `call_indirect` instruction where branch targets are not related (distantly placed in code) and the control flow must precisely select the correct target.    - Checks for: Ensuring branch target selection is accurate and independent of the operand stack.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (param i32)))
    (table funcref (elem $func1))
    (func $func1 (result i32) (i32.const 42))
    (func $test
      (block (loop (call_indirect (type 1) (i32.const 0)) (br 2)))
    )
  )
  "type mismatch"
)