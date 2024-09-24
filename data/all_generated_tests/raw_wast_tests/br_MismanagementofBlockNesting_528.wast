;; 9. Construct a nested structure with an `if-else` inside a `loop`, and place a `br` instruction within the `else` branch to target an outer block. Ensure the branch properly exits the `loop` and continues past the outer block’s `end`. This validates correct execution flow from nested conditional branches within loops.

(assert_invalid
  (module
    (func $nested-if-else-loop
      (block $outer
        (loop $inner
          (if (i32.const 0)
            (then (nop))
            (else (br $outer))
          )
        )
      )
    )
  )
  "type mismatch"
)