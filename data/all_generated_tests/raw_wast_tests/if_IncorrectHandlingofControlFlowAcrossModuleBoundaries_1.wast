;; 2. **Test Description:**    Use an `if` instruction where the `else` block contains a call to an exported function that performs multiple operations manipulating the stack. Ensure the correct stack state upon returning from the call when the condition is false.

(assert_invalid
  (module
    (func $exported (export "exported") (param i32) (result i32)
      local.get 0
      i32.add
      local.get 0
      i32.add
    )
    (func (param i32) (result i32)
      local.get 0
      if (result i32)
        (i32.const 42)
      else
        (call $exported (i32.const 1))
      end
    )
  )
  "type mismatch"
)