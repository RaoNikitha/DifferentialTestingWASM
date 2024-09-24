;; 3. Implement a structure where a `loop` encloses a `block`. Branch out of the loop using a `br` to an outer `block`, with an invalid label causing control to reach an `unreachable` instruction unexpectedly.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block
            (br 2)
          )
        )
      )
      (unreachable)
    )
  )
  "unknown label"
)