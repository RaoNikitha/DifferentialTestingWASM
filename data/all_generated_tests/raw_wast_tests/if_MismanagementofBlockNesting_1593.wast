;; 4. **Mismatched `end` in Nested Blocks**: Introduce an `if` block within another `if` block, but with an incorrectly placed `end` instruction, to verify if the implementation correctly recognizes and handles mismatched `end` statements during validation.

(assert_invalid
  (module (func $mismatched-end-nested
    (block 
      (i32.const 1) 
      (if (i32.const 1) 
        (then 
          (if (i32.const 0)
            (then (drop))
            (else (drop))
        )
      )
      (end)
    )
  ))
  "mismatched end"
)