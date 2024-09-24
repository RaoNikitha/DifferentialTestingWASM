;; 3. **Test Description:**    - **Test Scenario:** Construct a block with nested `if-else` conditions, where the `else` block contains an `unreachable` instruction. Use `br` to branch out from the innermost `if` condition.    - **Specific Constraint:** Validate the branch targets and the operand stack management during conditional branching.    - **Relation to Unreachable Code Execution:** Verify that the `br` instruction prevents execution from reaching the `unreachable` instruction in the `else` block.

(assert_invalid
  (module
    (func $test
      (block
        (if (i32.const 1)
          (then
            (br 1)
          )
          (else
            (unreachable)
          )
        )
      )
    )
  )
  "unknown label"
)