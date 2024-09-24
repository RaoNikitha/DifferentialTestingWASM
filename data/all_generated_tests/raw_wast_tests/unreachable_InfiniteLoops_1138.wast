;; Implement a loop with a `br_if` instruction that’s intended to exit the loop on `true` but follows an `unreachable` instruction on `false`, ensuring the loop terminates correctly and doesn’t run indefinitely due to `unreachable`.

(assert_invalid
  (module
    (func $loop-with-unreachable
      (loop
        (br_if 0 (i32.const 1))
        (unreachable)
      )
    )
  )
  "type mismatch"
)