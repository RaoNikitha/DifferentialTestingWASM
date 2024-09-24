;; 1. Create a function containing a `block` with a nested `loop`. Within the `loop`, use the `br` instruction to erroneously target the `block` instead of the `loop`. Immediately after the intended `br` instruction, place an `unreachable` instruction to check if the trap is triggered at the correct point in the intended target environment.

(assert_invalid
  (module
    (func
      (block
        (loop
          (br 1)
          (unreachable)
        )
      )
    )
  )
  "invalid label"
)