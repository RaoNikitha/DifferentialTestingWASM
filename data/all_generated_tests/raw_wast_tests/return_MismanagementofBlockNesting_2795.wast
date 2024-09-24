;; 4. Construct a test with a function that includes loop within a loop, and place a `return` in the innermost loop. This checks if the control flow correctly returns from the function instead of just breaking the inner loop, focusing on how the nested loops handle `return`.

(assert_invalid
  (module
    (func $nested-loops-return (result i32)
      (block (loop (loop (return) (br 1))))
    )
  )
  "type mismatch"
)