;; 9. **Test 9: Operand Stack Restoration Leading to Unreachable**    - Design a `block` wherein a `br` instruction targets another block requiring restoration of specific operand types, with a subsequent `unreachable` instruction.    - Verifies if the restoration logic is flawed, leading to improper stack state and execution reaching the `unreachable`.

(assert_invalid
  (module
    (func $test-block-unreachable
      (block (result i32)
        (block
          (i32.const 0)
          (br 1)
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)