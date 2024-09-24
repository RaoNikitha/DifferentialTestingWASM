;; Write a loop that iterates a fixed number of times and includes a `br_if` to an outer block with an `unreachable` instruction inside the block. Check if the condition in `br_if` is always incorrectly leading to a trap after any iteration.

(assert_invalid
  (module (func $type-loop-br_if-unreachable
    (block $outer
      (loop $inner
        (i32.const 1)
        (br_if $outer)
        (br $inner)
      )
      (unreachable)
    )
  ))
  "type mismatch"
)