;; 4. Implement an `if` instruction without an `else` part, followed by a `br_if` that evaluates to false. Ensure subsequent instructions after `end` execute correctly. This checks for proper flow control without entering any branch.

(assert_invalid
  (module (func $missing-else-with-br_if
    (i32.const 1)
    (if (result i32) (i32.const 1)
      (then (i32.const 1))
    )
    (br_if 0 (i32.const 0))
    (i32.const 42)
    (drop)
  ))
  "type mismatch"
)