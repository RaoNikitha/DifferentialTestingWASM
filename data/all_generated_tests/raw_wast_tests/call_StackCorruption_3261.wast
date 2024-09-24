;; **Test 10**: Call a function which itself calls another function that returns void. - **Constraint Checked**: Proper return value type management. - **Stack Corruption Risk**: Handling void return types incorrectly in wizard_engine might mismanage stack frames, leaving unexpected values on the stack.

(assert_invalid
  (module
    (func $inner (result i32)
      (i32.const 0)
    )
    (func $outer (result i32)
      (call $inner)
      (call $inner)
      (drop)
      (call 0)
    )
    (func (call $outer))
  )
  "type mismatch"
)