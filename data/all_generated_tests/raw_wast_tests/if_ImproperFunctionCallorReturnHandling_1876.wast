;; 7. Write a test for an `if` block where a function call in the `then` block has an unreachable instruction, ensuring proper error/trap handling for invalid control flow paths.

(assert_invalid
  (module
    (func $if_with_unreachable
      (i32.const 1)
      (if (then (unreachable)))
    )
  )
  "unreachable executed"
)