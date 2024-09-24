;; 6. **Zero Arguments Passed to a Function Expecting Multiple Arguments**: Design a loop that always calls a function needing multiple arguments but deliberately provides none. This will check how the engine handles argument underflow conditions in loops.

(assert_invalid
  (module
    (func $test_arity_zero_args (loop (call 1)))
    (func (param i32 i32))
  )
  "type mismatch"
)