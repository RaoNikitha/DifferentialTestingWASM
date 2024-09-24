;; 10. **Test for Incorrect Branch to Loop Header with Type Expectation:**    Create a loop with an `i32` input type and use the `br` instruction to branch back to the loop start with an `i64` value. This checks whether the backward jump correctly enforces the loop's input type constraint.

(assert_invalid
  (module
    (func $test-loop-type-mismatch
      (loop $loop_label (param i32)
        (i64.const 1)
        (br $loop_label)
      )
    )
  )
  "type mismatch"
)