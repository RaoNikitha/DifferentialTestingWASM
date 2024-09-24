;; 2. **Test 2**: Construct a nested loop within an `if` statement. Use `br_if` to conditionally break out of the innermost loop and then check whether the branch properly respects the `if` condition and exits to the correct level. This ensures that the label references within nested structures are correctly interpreted.

(assert_invalid
  (module
    (func $nested-loop-if
      (i32.const 1)
      (block
        (if (result i32)
          (then
            (loop
              (br_if 1 (i32.const 1))
              (br 1)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)