;; 2. **Test with Unreachable Code Block**:    - **Description**: Use `unreachable` followed by a `call` to ensure the function call is not executed.    - **Constraint**: Tests the correct resolution of the branch target when control flow is diverted by an `unreachable` command.    - **Relation to Incorrect Branch Target Resolution**: An incorrect branch resolution might lead to the `call` being executed despite the `unreachable` instruction.

(assert_invalid
  (module
    (func $unreachable-followed-by-call
      (unreachable)
      (call 0)
    )
    (func)
  )
  "unreachable code"
)