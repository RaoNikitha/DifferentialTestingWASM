;; 8. **Test Description:**    A block with a nested loop and `br_if` which incorrectly checks a condition causing the loop to always repeat.      **Constraint Checked:** Proper evaluation of conditions within `br_if`.      **Relation to Infinite Loops:** Verifies if conditions are evaluated correctly and allow the loop to terminate.

(assert_invalid
  (module
    (func $infinite-loop-condition (result i32)
      (block (result i32)
        (i32.const 0)
        (loop (block (result i32)
          (br_if 1 (i32.const 1))
          (br 0)
        ))
      )
    )
  )
  "condition always true causing infinite loop"
)