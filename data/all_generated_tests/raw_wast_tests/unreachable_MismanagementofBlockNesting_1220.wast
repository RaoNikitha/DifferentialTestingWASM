;; 1. **Nested Blocks with Unreachable Inside Inner Block:**    - Create a function with nested blocks (`block` inside a `block`). Place the `unreachable` instruction inside the inner block. The test checks if the outer block is correctly terminated when `unreachable` is executed.

(assert_invalid
  (module (func $nested-blocks-with-unreachable
    (block (result i32)
      (block (result i32)
        (unreachable)
      )
      (i32.const 1)
    )
  ))
  "type mismatch"
)