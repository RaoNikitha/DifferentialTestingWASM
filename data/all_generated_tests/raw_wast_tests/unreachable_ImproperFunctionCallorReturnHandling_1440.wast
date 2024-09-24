;; 1. **Test Description:**     Validate the behavior of `unreachable` within a function that calls another function which itself immediately calls `unreachable`. The test ensures proper trapping occurs in both nested and outer function calls.    **Constraint Checked:** Proper handling of nested calls and correct trapping mechanism.    **Relation to Improper Call/Return Handling:** This test checks if the function calling mechanism can correctly propagate traps through nested call chains.

(assert_invalid
  (module
    (func $nestedUnreachable
      (call $innerUnreachable)
    )
    (func $innerUnreachable
      (unreachable)
    )
    (call $nestedUnreachable)
  )
  "unreachable executed"
)