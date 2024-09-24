;; 7. **Test Description**: Write a `block` that is meant to result in `[]`, but deliberately include a `block` instruction inside it with a mismatched output type `i32`. It aims to verify outer block validation of inner block results.

(assert_invalid
  (module (func $block-mismatch-output
    (block (block (result i32) (i32.const 42)) (drop))
  ))
  "type mismatch"
)