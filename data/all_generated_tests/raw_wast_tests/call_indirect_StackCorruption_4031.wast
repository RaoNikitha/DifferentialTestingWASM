;; 10. **Consuming Function Return Value Test**:     - **Description**: Make a `call_indirect` call to a function that returns a value and ensure the return value is correctly placed on the stack.     - **Constraint Check**: Validate the returned value matches the function’s expectation.     - **Stack Corruption Check**: Ensure subsequent stack operations use the returned value properly without misalignment.  These tests leverage specific constraints, focusing on different edge cases and potential pitfalls in stack management when using the `call_indirect` instruction. They aim at highlighting any stack-related discrepancies in the different implementations of WebAssembly and wizard_engine.

(assert_invalid
  (module
    (type $sig (func (result i32)))
    (func $ret_i32 (result i32) (i32.const 42))
    (table 1 funcref)
    (elem (i32.const 0) $ret_i32)
    (func (result i32)
      (local $val i32)
      (local.set $val (call_indirect (type $sig) (i32.const 0)))
      (i32.add (local.get $val) (i32.const 10))
    )
  )
  "type mismatch"
)