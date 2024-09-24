;; 6. **Test Description:**    - Build a loop with nested blocks where an inner block contains a `br` that targets an outer block. Intentionally swap the input and output types of blocks.    - **Constraint Checking:** Examines whether the `br` implementation correctly handles type assignments between nested blocks.    - **Relation to Infinite Loops:** Incorrect type handling can misroute control flow, trapping execution in an infinite loop.

(assert_invalid
  (module
    (func (block (result i32) (loop (block (result f32) (br 1)))))
  )
  "type mismatch"
)