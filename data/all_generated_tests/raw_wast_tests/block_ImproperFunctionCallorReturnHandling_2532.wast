;; 3. **Test Return from Block with Incorrect Type:**    - Design a `block` that ends with a `return` instruction bringing back a value of incorrect type than specified by the `blocktype`.    - **Constraint:** Ensures error handling for mismatched return types within block instructions.

(assert_invalid
  (module (func $block-return-incorrect-type (result i32)
    (block (result i32) (i64.const 1) (return))
  ))
  "type mismatch"
)