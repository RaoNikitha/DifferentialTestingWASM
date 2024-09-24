;; 5. **Test Description**: Develop a loop that will call a function which conditionally returns early via a `br_if` check. Ensure that `br_if`'s conditional handling influences loop behavior correctly.    **Constraint Checked**: Conditional early returns from function calls and resulting loop behavior.

(assert_invalid
  (module (func $cond-loop 
    (loop (result i32)
      (call $cond-func)
    )
  )
  (func $cond-func (result i32)
    (br_if 0 (i32.const 1))
  ))
  "type mismatch"
)