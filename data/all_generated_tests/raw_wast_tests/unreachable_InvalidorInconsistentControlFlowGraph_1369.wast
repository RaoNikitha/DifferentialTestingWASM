;; 10. **Test Case: Unreachable Inside Complex Control Structures**     - Description: Combine `unreachable` with a mix of `block`, `loop`, and `if-else` structures within a single function to create a complex control flow, ensuring universal interruption.     - CFG Constraint: A comprehensive test to verify that regardless of the position or nesting level, the `unreachable` instruction consistently interrupts the entire CFG correctly, testing complex edge cases.

(assert_invalid
  (module (func $test-complex-structure
    (block
      (loop
        (if (i32.const 1)
          (then (unreachable))
          (else (i32.const 0))
        )
      )
      (br 0)
    )
    (i32.add)
  ))
  "type mismatch"
)