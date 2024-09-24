;; 8. **Return Inside Nested Loop Structures**:    - Design nested loop structures with various return points. This ensures the correct implementation of stack rewinding and return to the outermost block when `return` is hit within such complex structures.

(assert_invalid
  (module
    (func $nested_loops_return (param i32) (result i32)
      (block (loop (loop (br_if 0 (i32.const 1)) (return (i32.const 2)) (br 1))))
    )
  )
  "type mismatch"
)