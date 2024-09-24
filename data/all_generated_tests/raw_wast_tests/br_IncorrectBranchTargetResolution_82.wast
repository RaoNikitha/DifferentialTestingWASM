;; 3. **Complex Nesting with If Condition Test**:    - Implement a deeply nested structure containing `block`, `loop`, and `if` instructions. Utilize `br` to target an outer `if` condition, then verify that the branch does not intersect unintended blocks or loops within the nesting. This is to ensure proper label resolution among mixed control instructions.

(assert_invalid
  (module
    (func
      (block
        (loop
          (if (i32.const 1)
            (then
              (br 2)
            )
          )
        )
      )
    )
  )
  "unknown label"
)