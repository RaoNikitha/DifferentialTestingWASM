;; 9. Write a function containing `br_if` with an `unreachable` instruction as part of the break target. Ensure consistent error handling and check that no stack corruption occurs when the branch condition is false.

(assert_invalid
  (module (func
    (block
      (br_if 0 (unreachable))
      (i32.const 1)
    )
    (drop)
  ))
  "type mismatch"
)