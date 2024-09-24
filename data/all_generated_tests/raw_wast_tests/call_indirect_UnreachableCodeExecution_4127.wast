;; 6. **Multiple Sequential Call_Indirect with an Intermediate Unreachable**:    - Sequence multiple `call_indirect`, one being correct and another with a deliberate error leading to a trap and ultimately hitting an `unreachable` instruction.    - Examines error recovery and confirms traps occur before reaching the unreachable instruction despite valid intermediate steps.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (func $valid_func (type 0) (param i32) (result i32) local.get 0)
    (func $invalid_func (type 0) (param i32) (result i32)
      (call_indirect (type 0) (i32.const 0) (i32.const 0))
      unreachable)
    (table 2 funcref)
    (elem (i32.const 0) $valid_func $invalid_func)
    (func $test
      (i32.const 0) (call_indirect (type 0) (i32.const 0))
      (i32.const 1) (call_indirect (type 0) (i32.const 1))
    )
  )
  "type mismatch"
)