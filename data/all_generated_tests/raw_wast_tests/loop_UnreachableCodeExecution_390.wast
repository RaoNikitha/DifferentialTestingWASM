;; - Test Case 1: Create a loop with an internal `br` instruction that branches to an `unreachable` instruction. This tests if label handling causes the branch to correctly avoid `unreachable`.

(assert_invalid
  (module (func $br-to-unreachable
    (block $label
      (loop (br $label) (unreachable))
    )
  ))
  "unreachable executed"
)