;; 6. **Test Description**: Create a `block` with a `valtype?` of `i64` but place a `br_if` instruction inside it that attempts to branch with an `f64` value. This will inspect how branching conditions and their types are validated within the block scope.

(assert_invalid
  (module (func $type-value-i64-vs-f64
    (block (result i64) (br_if 0 (f64.const 1.0)))
  ))
  "type mismatch"
)