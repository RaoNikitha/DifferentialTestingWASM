;; Use a nested `if` block where the inner `if` has a `false` condition that should bypass an `unreachable` instruction. This tests nested branching and ensures correct control flow to avoid unreachable instructions.

(assert_invalid
  (module
    (func $nested-if-unreachable
      (i32.const 1)
      (if (then
        (i32.const 0)
        (if (then (unreachable)))
      ))
    )
  )
  "type mismatch"
)