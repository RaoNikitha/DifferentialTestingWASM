;; 2. Place an `unreachable` instruction inside a `loop` that iterates a fixed number of times before jumping to a label outside of the loop using `br_if`. Ensure that executing the `unreachable` causes an immediate trap, and the loop condition is evaluated correctly up to that point.

(assert_invalid
  (module (func $type-loop-unreachable (result i32)
    (loop (block (i32.const 3) (unreachable) (br_if 0 (i32.const 0))))
  ))
  "type mismatch"
)