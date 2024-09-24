;; 2. **Test Description**:    Implement a function that declares local variables in different nested blocks. After manipulating these variables, use `return` in an inner block. The test checks if the `return` instruction unwinds the operand stack correctly, verifying that intermediate values are discarded.    - **Specific Constraint**: Checks correct stack unwinding upon `return`.    - **Incorrect Branch Target Resolution**: Addresses unwinding accuracy and operand handling when resolving `return`.

(assert_invalid
  (module
    (func $nested-local-vars (result i32)
      (local i32 i32)
      (i32.const 1)
      (local.set 0)
      (block
        (i32.const 2)
        (local.set 1)
        (block
          (i32.add (local.get 0) (local.get 1))
          (return)
        )
      )
      (local.get 0)
    )
  )
  "type mismatch"
)