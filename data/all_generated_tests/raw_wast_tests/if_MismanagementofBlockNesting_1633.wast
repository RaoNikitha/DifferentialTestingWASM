;; 4. Implement an `if` block inside another `if` block with an unmatched label index for a branch, causing an error in label resolution.    - **Constraint**: Labels must correctly index the intended block.    - **Behavior**: Incorrect implementation will misinterpret label depth and incorrect jumps.

(assert_invalid
  (module
    (func $nested-unmatched-label
      (if (i32.const 1)
        (then
          (if (i32.const 1)
            (then (br 2))
          )
        )
      )
    )
  )
  "unknown label"
)