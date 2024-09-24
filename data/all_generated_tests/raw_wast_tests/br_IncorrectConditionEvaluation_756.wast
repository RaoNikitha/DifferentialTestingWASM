;; Test 7: Design a nested structure with multiple `block` statements, each containing a `br_if`. Each `br_if` should only branch if different conditions are met (e.g., positive number). Evaluate each condition to confirm precise branching behavior based on condition checking.

(assert_invalid
  (module
    (func $nested-blocks-br_if
      (block
        (block
          (br_if 1 (i32.const 1)) 
        )
        (block
          (br_if 2 (i32.const 0)) 
        )
      )
    )
  )
  "unknown label"
)