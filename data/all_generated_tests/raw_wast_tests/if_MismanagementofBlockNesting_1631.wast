;; 2. Create an `if` block within a loop, where the `then` branch contains a `br_table` instruction targeting an outer loop, ensuring correct unwinding of the stack and validation of jump targets.    - **Constraint**: Verify that labels are properly managed for branching out of loops.    - **Behavior**: Mismanagement may cause the branch to exit the wrong loop.

(assert_invalid
  (module
    (func $test
      (loop $outer_loop
        (if (result i32) (i32.const 1)
          (then
            (br_table $outer_loop) ;; Mismanagement of labels might cause this to exit wrong loop
          )
        )
      )
    )
  )
  "type mismatch"
)