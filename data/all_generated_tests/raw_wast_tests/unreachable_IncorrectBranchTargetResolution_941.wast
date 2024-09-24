;; 2. Design a loop with an `unreachable` inside it followed by a `br` that points to the start of the loop. Check if the trap occurs immediately, preventing the loop’s start label from being reached.

(assert_invalid
  (module (func $test-loop-unreachable-br
    (loop (unreachable) (br 0))
  ))
  "unreachable executed before break"
)