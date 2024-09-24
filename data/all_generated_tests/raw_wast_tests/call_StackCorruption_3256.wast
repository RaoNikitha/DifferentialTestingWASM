;; **Test 5**: Use a `call` instruction to a function with multiple return values. - **Constraint Checked**: Handling of multiple return values. - **Stack Corruption Risk**: Mismanagement in pushing multiple return values to the stack may cause misalignment and stack corruption.

(assert_invalid
  (module
    (type (func (result i32 i32)))
    (func $multiple_return
      (i32.const 1)
      (i32.const 2)
    )
    (func (result i32 i32)
      (call $multiple_return)
    )
  )
  "type mismatch"
)