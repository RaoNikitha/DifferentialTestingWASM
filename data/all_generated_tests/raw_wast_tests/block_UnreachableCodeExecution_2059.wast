;; 10. **Test 10: Calling Function with Internal Unreachable**     - **Description**: Create a function containing a `block` with an internal `unreachable` instruction, called within another block. Check whether the function call correctly handles the trap caused by `unreachable`.     - **Constraint**: Checks proper error propagation when a function containing `unreachable` is executed within a block.

(assert_invalid
  (module
    (type $sig (func))
    (func $test
      (block
        (call $inner)
      )
    )
    (func $inner
      (block
        unreachable
      )
    )
  )
  "unreachable code"
)