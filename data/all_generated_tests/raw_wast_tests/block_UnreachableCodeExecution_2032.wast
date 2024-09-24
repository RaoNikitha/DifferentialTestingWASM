;; 3. **Incorrectly Nested End**:    - Construct a block whose nested ends do not match properly. Follow this with an `unreachable` instruction.    - This checks nesting validation and proper closing of blocks.    - An implementation missing this might execute the `unreachable` instruction.

(assert_invalid
  (module (func $incorrectly-nested-end
    (block (result i32)
      (block (result i32) (i32.const 10))
    )
    (unreachable)
  ))
  "unexpected end of section or function"
)