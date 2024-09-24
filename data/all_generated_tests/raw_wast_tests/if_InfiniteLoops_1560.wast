;; 1. **Test Description**:    Stack initialization with a loop containing an `if` that evaluates a condition `i32.eqz` before branching using `br_if`:    - Checks if the `if` properly sets up the label context and the condition evaluation works as expected.

(assert_invalid
  (module (func $test (result i32)
    (loop (if (result i32) (i32.eqz (i32.const 0))
      (then (br_if 1 (i32.const 1)) (i32.const 1))
      (else (i32.const 0))
    ))
  ))
  "type mismatch"
)