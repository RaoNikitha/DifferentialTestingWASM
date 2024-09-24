;; 5. **Test Description**: Create a scenario with a `br_if` within an `if` condition, where the condition for `br_if` is non-zero. Ensure that execution jumps out of the `if` block correctly.

(assert_invalid
  (module (func $br_if_inside_if
    (if (i32.const 1)
      (block
        (br_if 0 (i32.const 1))
      )
    )
  ))
  "unknown label"
)