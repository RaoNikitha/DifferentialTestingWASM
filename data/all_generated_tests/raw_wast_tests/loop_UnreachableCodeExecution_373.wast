;; 4. **Loop with Br_table Targeting Unreachable**:    - Implement a loop with a `br_table` instruction where one of the branch targets leads to an `unreachable` instruction.    - **Constraint**: Ensures correct handling of indirect branches and out-of-bounds targets.    - **Relation to Unreachable Code Execution**: Misinterpretation of the `br_table` targets should not reach `unreachable` unexpectedly.

(assert_invalid
  (module
    (func $loop_with_br_table
      (block $outer
        (loop $inner
          (i32.const 0)
          (br_table $outer $inner)
        )
      )
      (unreachable)
    )
  )
  "unreachable code executed"
)