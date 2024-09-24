;; 2. **Test Description:**    Use an `if` instruction where the `else` block contains a call to an exported function that performs multiple operations manipulating the stack. Ensure the correct stack state upon returning from the call when the condition is false.

(assert_invalid
  (module
    (func $manipulate_stack (result i32)
      (i32.const 5)
      (i32.const 3)
      (i32.add)
    )
    (export "manipulate_stack" (func $manipulate_stack))
    (func (result i32)
      (i32.const 0)
      (if (result i32)
        (i32.const 42)
        (else
          (call $manipulate_stack)
        )
      )
    )
  )
  "type mismatch"
)