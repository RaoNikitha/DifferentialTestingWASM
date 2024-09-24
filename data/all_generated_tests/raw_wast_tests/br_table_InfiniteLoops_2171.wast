;; 1. **Test 1**: Create a loop that continuously increments a counter. Use `br_table` to exit the loop when the counter reaches a specific value. Ensure label indices are correctly handled such that the counter condition is consistently evaluated.     - **Constraint**: Ensures proper label handling and stack type validation.    - **Relation to Infinite Loops**: Incorrect label handling could prevent the loop from exiting, causing an infinite loop.

(assert_invalid
  (module
    (func $test-loop-with-br-table
      (local $counter i32)
      (block
        (loop $loop
          (local.set $counter (i32.add (local.get $counter) (i32.const 1)))
          (br_table $exit $loop (local.get $counter))
        )
      $exit)
    )
  )
  "unknown label"
)