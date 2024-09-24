;; 10. **Test for Mismatched Types with Loop Exit via Return**: Create a loop that exits early using a `return` instruction where the type returned is different from what the loop's block type expects after execution ends.

(assert_invalid
  (module (func $mismatched-loop-exit-via-return
    (result i32)
    (loop (result i32)
      (return (f32.const 1.0))
    )
  ))
  "type mismatch"
)