;; Test Description 5: Implement a block where a loop contains `br` instructions with different nesting levels. The goal is to verify if changing nesting levels accurately updates the context to avoid infinitely branching incorrectly.

(assert_invalid
  (module (func $test_br_nested_levels
    (block
      (loop (br 1))
      (br 1)
    )
  ))
  "invalid branch depth"
)