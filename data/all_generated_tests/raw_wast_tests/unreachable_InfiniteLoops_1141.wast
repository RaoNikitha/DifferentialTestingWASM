;; Test 2: Implement a nested loop where the inner loop conditionally executes an `unreachable` instruction based on a `br_if` instruction in the outer loop, verifying if the divergence occurs.

(assert_invalid
  (module (func $nested-loop-unreachable-test
    (block
      (loop $outer
        (br_if $outer (i32.const 0))
        (loop
          (unreachable)
        )
      )
    )
  ))
  "type mismatch"
)