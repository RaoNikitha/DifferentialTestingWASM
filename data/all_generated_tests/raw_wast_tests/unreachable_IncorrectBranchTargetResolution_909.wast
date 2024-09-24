;; 10. Set up a nested `loop` scenario with an `unreachable` inside a conditional block, where a `br_if` instruction targets the outer loop. Check that `unreachable` traps right away, ensuring no incorrect branch target resolution occurs.

(assert_invalid
  (module
    (func $nested-loop-unreachable
      (loop $outer
        (block $inner
          (br_if $outer (i32.const 1))
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)