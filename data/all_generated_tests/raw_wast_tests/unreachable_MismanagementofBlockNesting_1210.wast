;; 1. A test with an `unreachable` instruction placed within a nested `block` and `loop` structure, followed by a `br_table` that should normally break to the appropriate block depth. This checks if the error in the `unreachable` disrupts the correct breaking behavior.

(assert_invalid
(module
  (func $test-unreachable-in-nested-block-loop-br_table
    (block $outer
      (loop $inner
        (unreachable)
        (br_table 0 0)
      )
    )
  )
)
"type mismatch"
)