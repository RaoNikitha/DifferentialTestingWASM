;; 1. **Test Description 1**: Generate a loop with an incorrectly indexed `br` instruction targeting an outer block instead of the intended loop block. Check if this misindexed branch causes the program to mistakenly reach an `unreachable` instruction after failing to jump correctly.

(assert_invalid
  (module (func $misindexed-br
    (block (loop (br 1)) (unreachable))
  ))
  "unknown label"
)