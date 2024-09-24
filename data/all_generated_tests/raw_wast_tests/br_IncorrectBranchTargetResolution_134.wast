;; 5. **Branch out of Nested Control:**    Design a function with `block` inside a `loop`, using the `br` instruction to exit the `loop` and target the outer `block`. This test verifies that the branch correctly targets the label of the `block` after `loop` termination.

(assert_invalid
  (module (func (block (loop (block (br 2))))))
  "type mismatch"
)