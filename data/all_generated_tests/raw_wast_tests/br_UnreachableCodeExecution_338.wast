;; Construct a sequence of `block` and `if` statements where an internal `br` instruction tries to break to an undefined label index. This should trigger the `unreachable` instruction if the branch doesn't correctly interpret relative labels.

(assert_invalid
  (module
    (func
      (block
        (block
          (br 2) 
        )
      )
    )
  )
  "unknown label"
)