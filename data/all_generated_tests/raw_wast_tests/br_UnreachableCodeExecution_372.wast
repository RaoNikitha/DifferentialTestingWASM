;; 3. Use a `br` instruction targeting a valid label, but immediately follow it with an `unreachable` instruction inside a loop to test if the unwinding and branching mechanism properly avoids the `unreachable` code.

(assert_invalid
  (module
    (func $test_br_unreachable
      (block
        (loop
          (br 1)
          unreachable
        )
      )
    )
  )
)