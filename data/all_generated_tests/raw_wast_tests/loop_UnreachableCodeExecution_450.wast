;; 1. **Loop with Nested Unreachable Instruction**:    - Test a loop that contains an inner block with an `unreachable` instruction. Insert a conditional branch inside the loop that incorrectly always branches to the inner block, causing the `unreachable` instruction to execute.    - **Constraint**: This test checks if the loop handles branching correctly and avoids triggering the `unreachable` instruction mistakenly due to faulty branch conditions.    - **Unreachable Code Execution**: Ensures correct branch execution within the loop to prevent reaching `unreachable`.

(assert_invalid
  (module
    (func $nested-unreachable (result i32)
      (loop (result i32)
        (block
          (br_if 1 (i32.const 1))
          (unreachable)
        )
        (i32.const 0)
      )
    )
  )
  "unreachable executed"
)