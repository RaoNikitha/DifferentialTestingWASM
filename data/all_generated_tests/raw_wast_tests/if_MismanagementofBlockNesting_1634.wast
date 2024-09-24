;; 5. Create an `if` block that ends with another block type using an `else` instruction to transition between differing block types. Validate correct type matching and flow control.    - **Constraint**: Ensure that transition between blocks preserves type integrity.    - **Behavior**: Mismanagement can result in an invalid type stack.

(assert_invalid
  (module (func $mismatch-blocktype
    (if (result i32) (i32.const 1)
      (then (i32.const 2))
      (else (block (result f32) (f32.const 1.0)))
  )))
  "type mismatch"
)