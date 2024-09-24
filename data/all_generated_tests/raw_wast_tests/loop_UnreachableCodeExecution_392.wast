;; - Test Case 3: Implement a `loop` containing a `br_if` instruction with a condition that will always fail, followed by an `unreachable` instruction outside the loop. This checks that the failure condition does not erroneously skip ahead to `unreachable`.

(assert_invalid
  (module
    (func $test-loop-br_if
      (loop
        (br_if 0 (i32.const 0))
        (unreachable)
      )
    )
  )
  "unreachable code"
)