;; 9. **Test Functions with Multiple Return Values**:    - **Description**: Create a function that returns multiple values and have a `call x` instruction invoke it.    - **Constraint**: The calling instruction should correctly handle multiple return values on the stack.    - **Relation to CFG**: Improper CFG handling may mismanage return values, causing stack corruption or unexpected results.

(assert_invalid
  (module
    (type (func (param i32) (result i32 i32)))
    (func $f (result i32 i32)
      i32.const 1
      i32.const 2
    )
    (func $test-call-multiple-returns
      (call 0 (i32.const 0))
    )
  )
  "type mismatch"
)