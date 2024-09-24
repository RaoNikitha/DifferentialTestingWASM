;; 1. **Mismatched Label Handling in Nested Loops**: Create a test with multiple nested loops and a `br` instruction that targets an outer loop label. Check if the implementation correctly interprets the nested loop structure to branch to the correct target. Inconsistent label handling by the `require` function or `err_atpc` could cause mismanagement of control flow.

(assert_invalid
  (module
    (func $mismatched-labels
      (block (loop (result i32)
        (block (loop
          (br 2)  ;; This should target the outer loop but may cause differential behavior depending on label handling.
          (br 0)
        ))
        (i32.const 0)
      ))
    )
  )
  "unknown label"
)