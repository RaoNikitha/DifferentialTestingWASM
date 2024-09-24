;; 5. **Test Description 5:** Employ `unreachable` at the end of a `loop` constructing that itself is nested within a `block`, where the block expects a final stack type of `[i32]`. This ensures the system correctly flags the loop's result type mismatch enforced by unreachable.

(assert_invalid
  (module (func $unreachable-loop-nested-in-block
    (block (result i32)
      (loop
        (unreachable)
      )
    )
  ))
  "type mismatch"
)