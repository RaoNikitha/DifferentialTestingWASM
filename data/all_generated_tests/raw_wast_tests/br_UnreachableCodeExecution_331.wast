;; Create a loop with nested blocks where a `br` instruction incorrectly targets a label outside its valid range. This should cause the program to reach an `unreachable` instruction and trigger a trap if the branch index is not properly validated.

(assert_invalid
  (module
    (func $br_invalid_target
      (block
        (loop
          (block
            (br 4) 
          )
          (unreachable)
        )
      )
    )
  )
  "unknown label"
)