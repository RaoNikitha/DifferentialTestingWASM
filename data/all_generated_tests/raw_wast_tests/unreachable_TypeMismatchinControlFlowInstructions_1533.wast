;; 4. Insert an `unreachable` instruction within a nested block sequence where the inner block has an expected return type of `i32` but yield values of type `i64`. Ensure the engine flags the type mismatch correctly.

(assert_invalid
  (module (func $nested-unreachable-type-mismatch
    (block (block (unreachable)) (i64.const 0))
  ))
  "type mismatch"
)