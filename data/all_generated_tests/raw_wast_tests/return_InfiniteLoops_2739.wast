;; 8. **Loop with Multiple Exits and Final Return**:    Create a complex loop with multiple possible exit points before a `return` instruction, using combinations of `br` and `br_if`. This test ensures that all possible loop exits during iterations lead back correctly to the function's final return point, preventing endless looping.

(assert_invalid
  (module
    (func $complex-loop-multiple-exits (result i32)
      (loop $outer
        (i32.const 1)
        (br_if $outer (i32.const 0))
        (return (i32.const 42))
        (br $outer)
      )
    )
  )
  "type mismatch"
)