;; 3. **`br_if` Conditional Branch with Reverse Label Resolution**:    - Implement an `if` block where the `br_if` instruction targets a previous label based on certain conditions.    - Check if the conditional branching resolves correctly to the intended previous block.    - Tests the reverse indexing of label resolution within conditional contexts.

(assert_invalid
  (module (func $test-br_if-label-resolution
    (block $outer 
      (if (i32.const 1) (then
        (block
          (br_if 0 (i32.const 1)) 
          (i32.const 0)
        )
      ))
      (i32.const 0)
    )
  ))
  "type mismatch"
)