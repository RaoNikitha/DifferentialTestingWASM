;; 3. **Test Description**: A `block` with an explicit branch (`br`) targeting the end of the block containing an `unreachable` instruction. This test ensures that the validation logic properly handles branching and does not prematurely terminate for `unreachable` scenarios.

(assert_invalid
  (module (func $block-with-unreachable-br 
    (block
      (unreachable)
      (br 0)
    )
  ))
  "type mismatch"
)