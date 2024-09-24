;; 6. **Test 6: Unreachable In Incorrect Operand Type Handling**    - Create a `block` that expects certain operand types which are not on the stack when a `br` instruction is executed. Follow with an `unreachable`.    - Ensures the `br` instruction’s operand type checks prevent unexpected control flow to the unreachable instruction.

(assert_invalid
  (module
    (func $test-unreachable-incorrect-operand-type
      (block (result i32)
        (br 0)
        (unreachable)
      )
    )
  )
  "type mismatch"
)