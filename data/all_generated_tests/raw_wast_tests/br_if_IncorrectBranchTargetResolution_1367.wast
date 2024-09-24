;; Test 8: - Create a basic `block` and inside it, employ a `br_if` with label `0`. Introduce an additional independent block before the target block. Confirm the execution path is not incorrectly altered by the new block. - **Constraint Checked**: Correct Function Scoping. - **Relation to Incorrect Branch Target Resolution**: Checks if added structures disrupt proper label resolution.

(assert_invalid
  (module
    (func
      (block
        (block
          (i32.const 1)
          (br_if 0 (i32.const 1))
        )
        (unreachable)
      )
    )
  )
  "type mismatch"
)