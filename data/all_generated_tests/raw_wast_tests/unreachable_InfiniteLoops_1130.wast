;; 1. Create a loop that starts with the `unreachable` instruction, followed by more instructions that should be unreachable. Check if the loop conditionally repeats, confirming whether the initial `unreachable` correctly causes a trap before entering an infinite loop.

(assert_invalid
  (module (func $unreachable-in-loop
    (loop
      (unreachable)
      (i32.const 0)
      (br_if 0 (i32.const 1))
    )
  ))
  "type mismatch"
)