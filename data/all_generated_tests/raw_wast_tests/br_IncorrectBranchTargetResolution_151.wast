;; 2. **Test Description:**    Construct multiple nested `if` blocks within a loop, including a `br` instruction that targets a label within an outer `if` block. The test should check if the `br` instruction correctly identifies and resolves the target label of the outer `if` block, ensuring no unintended jumps to inner `if` blocks.

(assert_invalid
  (module
    (func $test
      (loop 
        (if 
          (then 
            (if 
              (then 
                (br 1)
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)