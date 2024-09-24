;; Test nested loops where an inner loop branches to an outer loop on condition, but if the condition is false, an `unreachable` instruction is executed. Validate if it traps instead of causing the loops to continue infinitely.

(assert_invalid
  (module
    (func $nested-loops-with-unreachable
      (loop $outer
        (loop $inner
          (br_if $outer (i32.const 0))
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)