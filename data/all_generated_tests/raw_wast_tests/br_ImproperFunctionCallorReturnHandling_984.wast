;; 5. **Test: Unreachable Block and Function Call Interaction**    - **Description**: Insert an unreachable block within a function that ends with a `br` instruction branching to a valid label outside the block. Ensure the `br` ends after function calls which may alter the operand stack unexpectedly.    - **Constraint Checked**: Ensures valid handling of `br` in the presence of unreachable blocks and subsequent function calls.    - **Improper Handling Aspect**: Mismanagement of stack height leading to invalid operations after return from a function.

(assert_invalid
  (module
    (func $test 
      (block $outer
        (block $inner
          unreachable 
          (br $outer)
        )
      )
      (call $dummyFunction)
    )
    (func $dummyFunction)
  )
  "undefined stack operation after br"
)