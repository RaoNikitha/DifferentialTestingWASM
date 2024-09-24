;; Design a loop with a nested loop, where an incorrect branch from the inner loop reaches an `unreachable` instruction in the outer loop. Ensure the inner loop's control flow does not cause the outer loop to hit `unreachable`.

(assert_invalid
  (module
    (func
      (loop
        (loop (br 1))
        (unreachable)
      )
    )
  )
  "unreachable instruction should not be hit"
)