;; 4. Design a `block` with the expected result type of `i32` followed by a `br` instruction that bypasses a stack-push of `f64`, testing if the jump instructions adhere to type constraints.

(assert_invalid
  (module (func $test (result i32)
    (block (result i32)
      (br 0 (i32.const 42))
      (f64.const 1.0)
    )
  ))
  "type mismatch"
)