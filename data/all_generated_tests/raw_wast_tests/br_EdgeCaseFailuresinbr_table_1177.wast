;; 8. Implement a `br_table` within an `if` construct with edge-case indices to check if forward branching (post `if` execution) behaves as intended and adheres to structured control flow rules, particularly focusing on index boundaries and fallbacks.

(assert_invalid
  (module
    (func $br_table_in_if
      (block
        (if (i32.const 1)
          (then
            (br_table 0 1 2 (i32.const 3))
          )
        )
      )
    )
  )
  "index out of bounds"
)