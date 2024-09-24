;; 2. **Test Description**: Implement a deeply nested `if` structure with multiple `br_if` instructions, each with conditions that only some should evaluate to `true`. Check if each `br_if` branches correctly according to the condition.

(assert_invalid
  (module
    (func $nested_if_branch
      (block
        (if (i32.const 1)
          (then
            (br_if 0 (i32.const 0))
            (br_if 1 (i32.const 1))
            (br_if 2 (i32.const 1))
          )
        )
      )
    )
  )
  "unknown label"
)