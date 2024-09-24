;; 2. **Loop with Conditional Branch**:    - **Description**: Design a loop where a `call` instruction is inside the loop, and the loop conditionally uses `br_if` to jump out of the loop based on a condition evaluated in the called function.    - **Reason**: This tests if the `br_if` condition is evaluated correctly and subsequently jumps out of the loop. A failure can cause an infinite loop if the jump never occurs.

(assert_invalid
  (module
    (func $conditional_branch_call
      (loop $outer
        (call $check_condition)
        (br_if $outer (i32.const 0))
      )
    )
    (func $check_condition (result i32)
      (i32.const 0)
    )
  )
  "type mismatch"
)