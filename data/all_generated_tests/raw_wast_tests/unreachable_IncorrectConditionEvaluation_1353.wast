;; 4. Design a function with a `block` containing a `br_if` instruction based on a false constant condition (e.g., `i32.const 0`). Include `unreachable` in the block following the `br_if`. Check if the `unreachable` trap occurs, which would indicate an incorrect condition evaluation.

(assert_invalid
  (module (func $test-unreachable-br_if
    (block
      (br_if 0 (i32.const 0))
      (unreachable)
    )
  ))
  "unreachable trap should occur"
)