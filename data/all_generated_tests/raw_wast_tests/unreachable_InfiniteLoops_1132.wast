;; Use the `unreachable` instruction after a conditional branch instruction with a `br_if` that evaluates false, forcing the loop to run indefinitely if `unreachable` does not trap. Verifies if invalid control paths lead to infinite loops.

(assert_invalid
  (module (func $test-unreachable-after-conditional-branch
    (block $loop
      (loop $inner
        (br_if $loop (i32.const 0))
        (unreachable)
      )
    )
  ))
  "type mismatch"
)