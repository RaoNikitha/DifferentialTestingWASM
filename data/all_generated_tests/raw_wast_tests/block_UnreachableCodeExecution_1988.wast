;; 9. **Test Description**: A `block` with the `loop` instruction inside of it where the loop body contains an `unreachable` instruction, validating if the loop’s execution and bounds are well managed in the context of `block`.

(assert_invalid
  (module (func $block-loop-unreachable
    (block (result i32)
      (loop (result i32)
        (unreachable)
      )
    )
  ))
  "type mismatch"
)