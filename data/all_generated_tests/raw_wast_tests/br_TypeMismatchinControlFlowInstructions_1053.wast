;; 4. **Test 4: `if` Block with Mismatched Branch Types**    - Use an `if` block that expects `i32` for branch conditions, but provide a `br` instruction using `f32`.    - Ensures correctness in branch type validation within conditional structures.    - Tests the consistency of type constraint enforcement in conditional control flow.

(assert_invalid
  (module (func $if-block-mismatched-branch
    (block (result i32)
      (if (result i32)
        (i32.const 1)
        (then (block (br 0 (f32.const 0.0))))
        (else (i32.const 42))
      )
    )
  ))
  "type mismatch"
)