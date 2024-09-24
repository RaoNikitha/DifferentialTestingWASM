;; 9. **Call to Function with Multiple Return Points**:    Create a test where the called function has multiple return points (due to multiple return statements inside conditionals). This validates if the CFG properly manages multiple exit points within a function and accurately validates the corresponding call instruction.

(assert_invalid
  (module
    (func $multi_return 
      (local i32)
      (if (i32.const 1)
        (then 
          (return (i32.const 2))
        )
        (else 
          (return (i32.const 3))
        )
      )
    )
    (func (call $multi_return))
  )
  "type mismatch"
)