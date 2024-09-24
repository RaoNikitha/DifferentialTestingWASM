;; 4. Implement a function containing a loop where `unreachable` is placed in the loop's body alongside a `br` instruction. The `br` instruction tries to exit the loop, but the `unreachable` disrupts the normal flow. This checks whether the trap takes precedence over the branch causing the loop to terminate early.

(assert_invalid
  (module (func $loop-unreachable-vs-br
    (loop (br 0) (unreachable))
  ))
  "type mismatch"
)