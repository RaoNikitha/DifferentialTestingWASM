;; 9. Create a situation where a `loop` contains a nested `if` statement, with the `br` instruction directing control to the loop from the `if` block. This checks for proper handling of structured control and backwards branching.

(assert_invalid
  (module
    (func $loop-nested-if
      (loop $loop
        (block
          (if (i32.const 1) (then (br 1)))
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)