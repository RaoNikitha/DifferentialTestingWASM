;; 3. **Test Description**:    An `if` condition with a branch to a label outside its enclosing loop relies on stack context preservation:    - Ensures improper context extension handling in `if` does not cause infinite loops upon branching.

(assert_invalid
  (module (func $if-loop-context (result i32)
    (block $outer (loop $inner
      (if (i32.const 0)
        (then (br $outer)) ;; branch to outer block
        (else (nop))
      )
      (br $inner)
    ))
    (i32.const 1)
  ))
  "type mismatch"
)