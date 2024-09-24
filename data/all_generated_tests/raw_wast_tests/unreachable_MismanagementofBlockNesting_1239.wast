;; 10. **Test Description:** Deeply nested `loop` and `block` structures where `unreachable` is placed in deeply nested inner loop's body. The test checks if the outer loops and blocks properly capture and handle the trap state flowing from the inner loop.        **Constraint Checked:** Deep nested loop control flow and trap management, ensuring outer structures correctly handle inner `unreachable` trap.

(assert_invalid
  (module (func $deep-nested-loop-unreachable
    (block (result i32)
      (loop (result i32)
        (block (result i32)
          (loop (result i32)
            (block (result i32)
              (loop (result i32)
                (block (unreachable))
              )
            )
          )
        )
      )
    )
  ))
  "type mismatch"
)