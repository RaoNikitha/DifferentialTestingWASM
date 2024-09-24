;; 6. **Cross-Level Branching Using br_if in Nested Loop**:    Develop a loop with nested loops employing `br_if` to refer back to the type of an enclosing loop incorrectly.    This verifies that branch conditions are properly respecting the enclosing loop’s type.

(assert_invalid
  (module
    (func $nested_loop_br_if
      (i32.const 1)
      (loop (result i32)
        (i32.const 2)
        (loop (result f32)
          (i32.const 3)
          (br_if 1)
          (drop)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)