;; Develop a combination of nested `loop` and `block` constructs. Place a `br` instruction that erroneously targets an incorrect `loop` label index, causing execution to fall through to an `unreachable` instruction if relative lookup is incorrect.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block
            (br 2)
          )
          (br 0)
        )
        (unreachable)
      )
    )
  )
  "unknown label"
)