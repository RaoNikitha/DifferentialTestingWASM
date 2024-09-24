;; 4. **Variable Number of Arguments across Iterations**: Implement a loop where the number of arguments provided to the call varies with each iteration. Expectation is that functions with different signatures are invoked incorrectly in successive iterations, potentially causing an infinite loop if argument checking fails.

(assert_invalid
  (module
    (type (func (param i32) (result i32)))
    (type (func (param i32 i32) (result i32)))
    (func $variable-args
      (block
        (loop
          (i32.const 1)
          (call_indirect (type 0) (i32.const 0))
          (br_if 0 (i32.const 0))
          (i32.const 1)
          (i32.const 1)
          (call_indirect (type 1) (i32.const 0))
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)