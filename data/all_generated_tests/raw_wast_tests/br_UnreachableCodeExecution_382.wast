;; 3. **Test 3: Missing Operand Stack Unreachable**    - Construct a `block` where a `br` instruction targets a label but the operand stack does not have the required types for the target block, followed by an `unreachable` instruction.    - Verifies if the `br` instruction correctly handles operand mismatches without causing execution to reach the unreachable instruction.

(assert_invalid
  (module
    (func 
      (block (result i32)
        (i32.const 0)
        (br 0)
      )
      (unreachable)
    )
  )
  "type mismatch"
)