;; 9. **Simultaneous Loops and Complex Branching**:    Test simultaneous loops at the same nesting level each containing various branch instructions to different loop levels. The goal is to ensure that the implementation differentiates and manages independent loop contexts correctly when branches target different loops within the same nesting scope.

(assert_invalid
  (module
    (func $simultaneous_loops
      (result i32)
      (loop (result i32)
        (i32.const 1)
        (loop (result i32)
          (br 1)
          (i32.const 2)
        )
      )
    )
  )
  "type mismatch"
)