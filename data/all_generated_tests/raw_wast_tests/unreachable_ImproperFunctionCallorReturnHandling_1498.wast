;; 9. **Trap during Call Sequence:**    - **Test Description:** Implement a function sequence where multiple functions are called consecutively, and one of these functions contains an `unreachable` instruction.    - **Constraint Checked:** Ensures the execution stops at the `unreachable` without continuing to subsequent function calls.    - **Improper Handling Aspect:** Tests proper interruption of function call sequences due to the `unreachable` trap.

(assert_invalid
  (module
    (func $func1
      (unreachable)
    )
    (func $func2
      (call $func1)
      (i32.const 10)
    )
    (func $func3
      (call $func2)
    )
  )
  "type mismatch"
)