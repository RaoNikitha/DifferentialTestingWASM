;; 9. A `block` containing nested `loop` constructs, with an inner `loop` containing a `br` targeting the outer `loop`, preceded by an `unreachable` instruction within the inner loop. This verifies that `br` correctly re-enters the outer loop bypassing unreachable code.

(assert_invalid
  (module
    (func $nested-loop-br-unreachable
      (block $outer
        (loop $inner
          unreachable
          (br $outer)
        )
      )
    )
  )
  "unknown label"
)