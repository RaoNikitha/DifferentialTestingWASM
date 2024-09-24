;; 1. **Incorrect Return Type in Block Context**:    Create a function that returns an `i32`, and call this function within a block meant to return an `f32`. Check if the `call` instruction within the block handles the type mismatch error properly.

(assert_invalid
  (module
    (type (func (result i32)))
    (type (func (result f32)))
    (func $incorrect-return-type
      (block (result f32)
        (call 0)
      )
    )
  )
  "type mismatch"
)