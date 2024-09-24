;; 9. Develop a test for an `if` instruction taking a condition but mismatched uses within nested blocks, such as pushing `f32` in the `then` branch and popping `i32` in the `else`. This tests the consistency of stack type between branches.

(assert_invalid
  (module (func $type-mismatch-between-branches
    (if (result i32) (i32.const 1)
      (then (f32.const 1.0)) 
      (else (i32.const 1))
    )
  ))
  "type mismatch"
)