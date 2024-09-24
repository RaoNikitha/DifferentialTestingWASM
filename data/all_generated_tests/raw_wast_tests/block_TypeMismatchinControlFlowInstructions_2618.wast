;; 9. **Type Inconsistency with `return`**: In a `block` with a declared type output of `i32`, use a `return` instruction that ends the block prematurely, returning a `f32` type. This checks whether the return instruction respects block type constraints.

(assert_invalid
  (module (func $type-inconsistency-return (result i32)
    (block (result i32) (return (f32.const 1.0)))
  ))
  "type mismatch"
)