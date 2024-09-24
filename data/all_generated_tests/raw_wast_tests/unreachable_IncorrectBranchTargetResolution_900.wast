;; 1. Place an `unreachable` instruction within a nested loop structure, then use the `br` instruction to jump to a parent loop label. Check if the `unreachable` causes a proper trap without misdirecting the `br` target.

(assert_invalid
  (module
    (func $nested-loop-unreachable (loop $outer (block $exit (loop $inner (unreachable) (br $outer)) (br $exit)))
  ))
  "type mismatch"
)