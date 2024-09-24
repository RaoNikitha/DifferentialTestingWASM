;; 4. Design a function that returns immediately after encountering a `nop`. This will test whether the early return is properly handled without interference from the `nop`, ensuring that the return value is what the function intends to produce.

(assert_invalid
  (module (func $test (result i32) (nop) (return (i32.const 42))))
  "type mismatch"
)