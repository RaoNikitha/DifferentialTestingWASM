;; 2. **Test Description**: Generate a loop that contains nested `loop` instructions with outer loop conditioned with a `br_if` that never exits, ensuring the inner loop correctly branches back to its start.    **Constraint Checked**: Proper functioning of nested loops and handling of multiple `br` instructions targeting different loop levels.    **Relation to Infinite Loops**: Tests the ability of the engine to exit nested loops correctly without causing infinite outer loop iterations.

(assert_invalid
  (module
    (func $nested_loops
      (i32.const 1)
      (loop (result i32)
        (loop (result i32)
          (i32.const 0)
          (br_if 1 (i32.const 1))
        )
        (br 0)
      )
    )
  )
  "type mismatch"
)