;; 7. **Test Description**: Use of `if` construct where the `else` block includes a call to an imported function returning a complex data structure affecting subsequent control flow.    **Constraint**: Ensures proper handling of complex return types from imported functions within control flow blocks.    **Goal**: Detects improper data structure management across module boundaries.

(assert_invalid
  (module
    (import "env" "complexFunc" (func $complexFunc (result (ref null extern))))
    (func (result extern)
      (if (result extern) (i32.const 1) 
        (then (ref.null extern)) 
        (else (call $complexFunc))
      )
    )
  )
  "type mismatch"
)