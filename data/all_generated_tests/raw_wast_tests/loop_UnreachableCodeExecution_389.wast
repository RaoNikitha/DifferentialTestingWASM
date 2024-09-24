;; 10. **Complex Loop with Nested Blocks Leading to Unreachable**:     Design a complex loop containing nested block structures and conditional branches with an unreachable instruction placed strategically. This tests combined mismanagement of labels, branching, and block handling leading to `unreachable` execution.

(assert_invalid
  (module
    (func $complex-loop
      (block $outer
        (loop $inner
          (block
            (br_if $outer (i32.const 0)) 
            (block
              (br 1) 
              (unreachable)
            )
            (br $inner)
          )
          (unreachable)
        )
      )
    )
  )
  "type mismatch"
)