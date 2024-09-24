;; 1. **Test Description:**    A loop with a `br_if` instruction meant to exit the loop based on a condition. The test checks if the program exits correctly when the condition is true. Incorrect implementation may result in the loop running indefinitely.

(assert_invalid
  (module (func $br_if-loop-exit
    (loop $loop
      (i32.const 1)
      (br_if $loop (i32.const 0))
    )
  ))
  "type mismatch"
)