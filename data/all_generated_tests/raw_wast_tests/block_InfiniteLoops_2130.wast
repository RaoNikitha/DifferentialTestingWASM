;; 1. **Test Description**: Create a `block` instruction with `br` targeting an invalid label depth that should result in an immediate error and not lead to an infinite loop.    - **Constraint**: Ensures that out-of-bound label depth errors are handled correctly and do not lead to left-over infinite loops.

(assert_invalid
  (module (func $invalid-label-depth
    (block (result i32)
      (br 1 (i32.const 42))
    )
  ))
  "unknown label"
)