;; Generate a loop where an erroneous branch instruction lands directly on an `unreachable` instruction inside the loop. Verify if the loop reinitializes correctly without executing the `unreachable`.

(assert_invalid
  (module (func $erroneous-branch-on-unreachable
    (loop (result i32)
      (br 0)
      (unreachable))
  ))
  "invalid branch target"
)