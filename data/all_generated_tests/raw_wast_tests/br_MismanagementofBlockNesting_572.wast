;; Test 3: Set up an `if` block inside a `block`, and place a `br` to break out of the `if` block back to the encompassing `block`. Ensure the branch correctly exits the `if` block and resumes at the enclosing block.

(assert_invalid
  (module (func $if-inside-block
    (block
      (if (i32.const 1)
        (then (br 1))
      )
    )
  ))
  "unknown label"
)