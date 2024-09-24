;; The following are 10 unique differential test descriptions to test for stack corruption based on the differences in the `call_indirect` instruction implementations in WebAssembly and wizard_engine:  1. **Function Index Out-of-Bounds Test**:    - **Description**: Define a `call_indirect` instruction with an operand that indexes beyond the bounds of the function table.    - **Constraint Check**: Ensure the stack behavior traps correctly without corruption.    - **Stack Corruption Check**: Verify that no additional stack elements are left behind or removed.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (elem (i32.const 0) $func)
    (func $func (param i32))
    (func (call_indirect (type 0) (i32.const 2)))
  )
  "index out of bounds"
)