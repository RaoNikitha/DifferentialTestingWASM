;; 3. **Conditional with `unreachable`:**    - **Description:** Use conditional logic (`if` and `else`) where one branch contains an `unreachable` instruction to check for correct handling of conditional stack management.    - **Constraint:** Ensure the branch with `unreachable` immediately traps and the stack is not altered incorrectly.    - **Relation to Stack Corruption:** Evaluates handling of stack changes within conditional paths.

(assert_invalid
  (module
    (func $conditional-unreachable (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (unreachable)
        )
        (else
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)