;; 7. **Test Description**: Combine multiple conditional branches with function calls, where one improperly evaluated branch targets an `unreachable` instruction, testing proper type matching on the operand stack.

(assert_invalid
  (module
    (func $target (result i32)
      (i32.const 42)
    )
    (func (param i32) (result i32)
      (local.get 0)
      (if (result i32)
        (i32.const 1)
        (call $target)
        (unreachable)
      )
    )
  )
  "type mismatch"
)