;; 4. Introduce a `block` inside a nested `loop`, with the `br` instruction targeting an outer `block` that skips the inner loop (e.g., `block (loop (block (br 1)))`). This ensures that the implementation respects the correct nesting levels for structured control flow.

(assert_invalid
  (module (func
    (block (loop (block (br 1))))
  ))
  "unknown label"
)