;; 3. **Nested Loops with Backward Branching:**    Implement a deeply nested loop with multiple backward branching, with each loop having distinct types of operands on the stack. Ensure that looping maintains stack integrity and type coherence across multiple iterations in both implementations.

(assert_invalid
  (module
    (func $nested-loop-backwards-branch
      (block $outer
        (loop $inner1
          (i32.const 1)
          (loop $inner2
            (i64.const 2)
            (br $inner1)
          )
        )
      )
    )
  )
  "type mismatch"
)