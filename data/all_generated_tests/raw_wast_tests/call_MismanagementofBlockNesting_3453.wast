;; 2. **Loop with Call inside Nested Blocks**:    - **Test Description**: Define a function that includes a loop containing nested blocks with a call instruction. The loop should exit based on a condition set by the called function. This tests how the engine handles loops and calls within nested structures.    - **Constraint Checked**: Argument stack management within nested loops.    - **Relation to Mismanagement of Block Nesting**: Tests the ability to maintain loop control within nested blocks and calls.

(assert_invalid
  (module
    (func $set-cond (result i32)
      (i32.const 1))
    (func $loop-with-call
      (i32.const 0)
      (loop $outer
        (block $inner
          (br_if $inner (i32.eq (call $set-cond) (i32.const 1)))
          (br $outer))
      )
    )
  )
  "type mismatch"
)