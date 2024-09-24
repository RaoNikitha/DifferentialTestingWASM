;; 4. Place an `unreachable` instruction within a nested loop, followed by a `br_if` instruction that conditionally jumps to an outer loop's label. Confirm that the conditional branch is never taken due to the immediate trap.

(assert_invalid
  (module (func $type-loop-unreachable-br_if (loop (unreachable) (br_if 1 (i32.const 0))))
  )
  "type mismatch"
)