;; 7. **Test 7**: Implement a deeply nested `if` instruction stack where inner `if` blocks influence the stack's operand types such that the outermost block ends with mismatched types, leading to stack type corruption when evaluated differently across implementations.

(assert_invalid
  (module (func $deep-nesting-type-mismatch
    (if (result i32)
      (i32.const 1)
      (then
        (if (result i64)
          (i32.const 1)
          (then (i64.const 0))
        )
      )
    )
  ))
  "type mismatch"
)