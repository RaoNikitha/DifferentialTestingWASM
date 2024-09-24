;; 2. Implement a test with multiple `if` blocks nested inside a loop, then issue a `br` to break out of the loop based on a condition. The test checks if the `br` instruction correctly interprets the label for the loop and ensures no incorrect jumps to inner `if` blocks occur.

(assert_invalid
  (module
    (func $nested-ifs-in-loop
      (loop
        (if (i32.const 1)
          (then
            (if (i32.const 0)
              (then (br 1))
            )
          )
        )
      )
    )
  )
  "unknown label"
)