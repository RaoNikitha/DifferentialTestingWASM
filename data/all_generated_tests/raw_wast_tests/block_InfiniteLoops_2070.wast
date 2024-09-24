;; 1. **Test Description:**    A block with a nested infinite loop where the loop has a `br_if` instruction conditional on a non-decreasing counter.      **Constraint Checked:** Ensuring correct stack unwinding and continuation.      **Relation to Infinite Loops:** Checks if the loop exits correctly when the condition is never met.

(assert_invalid
  (module (func $block-infinite-loop (result i32)
    (block $outer (result i32)
      (loop $inner
        (i32.const 0)
        (br_if $inner (i32.eqz (i32.const 0))) ;; Non-decreasing counter condition
      )
    )
  ))
  "stack mismatch"
)