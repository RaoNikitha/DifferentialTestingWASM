;; 1. **Test a `loop` with `unreachable`:**    - **Description:** Introduce an `unreachable` instruction inside a loop that performs stack operations. This checks if the stack is properly managed and not corrupted after the trap.    - **Constraint:** Ensure loop's stack state is maintained up to the point of `unreachable`.    - **Relation to Stack Corruption:** Checks for stack state preservation during control flow interruption.

(assert_invalid
  (module (func $type-stack-loop-unreachable
    (loop
      (i32.const 1)
      (unreachable)
    )
    (i32.add)
  ))
  "type mismatch"
)