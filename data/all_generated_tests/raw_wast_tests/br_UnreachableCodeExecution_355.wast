;; 6. **Test Description:**    - **Test Scenario:** Use nested `if` blocks with an `unreachable` instruction in the `then` branch. Use a `br` instruction to bypass the `then` branch conditionally.    - **Specific Constraint:** Validate that forward branches and conditional execution are correctly implemented.    - **Relation to Unreachable Code Execution:** Confirm that the `br` instruction prevents the `then` branch, containing `unreachable`, from being executed when the condition is false.

(assert_invalid
  (module
    (func $test
      (block
        (block
          (br_if 0 (i32.const 0))
          (unreachable)
        )
      )
    )
  )
  "unreachable executed"
)