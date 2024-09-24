;; 4. **Improper Nested Loop Branching**:    - Set up a nested `block` and `loop` combination, where `loop` contains a `br` targeting the outermost block.    - Check whether branching correctly resumes at the end of the outer block and not within the loop, focusing on accurate label indexing beyond nested loop constructs.

(assert_invalid
  (module
    (func $nested-loop-block (result i32)
      (block (result i32)
        (loop (result i32)
          (block (result i32)
            (br 2)
          )
        )
      )
    )
  )
  "type mismatch"
)