;; 4. **Test Description 4**: Create a loop that continues using a `br_if` placing an `unreachable` instruction inside the loop block but outside the branch target. Ensure incorrect branch handling does not cause execution within the loop to repeatedly hit the `unreachable` instruction.

(assert_invalid
  (module
    (func $test
      (loop (result i32)
        (br_if 0 (i32.const 1))
        unreachable
      )
    )
  )
  "type mismatch"
)