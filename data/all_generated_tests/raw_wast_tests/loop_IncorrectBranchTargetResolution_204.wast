;; 5. **Incorrect Branch to Non-existent Label**    - Construct a test where a `br` instruction references a non-existent label, ensuring the implementation correctly raises an error or handles it gracefully. This checks for proper label indexing and error handling.

(assert_invalid
  (module (func $branch_non_existent_label
    (loop (result i32)
      (br 1)
    )
  ))
  "unknown label"
)