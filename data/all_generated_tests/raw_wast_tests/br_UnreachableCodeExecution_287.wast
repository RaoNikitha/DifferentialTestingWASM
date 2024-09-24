;; 8. **Mismatched Operand Stack in Conditional Branching:**    - Test Description: In a block with an `if` conditional, insert a `br` instruction with mismatched operand handling, causing incorrect operand stack unwinding and leading to an `unreachable` instruction.    - Constraint: This tests the correct unwinding of the operand stack in conditional branching contexts.

(assert_invalid
  (module
    (func $mismatched-operand-stack
      (block
        (if (result i32) 
          (then 
            (br 0 (i64.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)