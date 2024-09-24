;; 7. **Loop Inside Conditional Block**:    - Description: Write a loop inside an `if` block with a `br` targeting an external loop based on a global variable condition. Ensure the correct loop is targeted depending on the variable.    - Reasoning: Ensures that branch targets inside conditional blocks resolve accurately to external loops.

(assert_invalid
  (module
    (global $g (mut i32) (i32.const 42))
    (func (loop $outer (loop $inner 
      (br_if $outer (global.get $g)) 
      (if (then (br $inner)))
    )))
  )
  "type mismatch"
)