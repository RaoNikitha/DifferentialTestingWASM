;; 3. Construct a `loop` block that expects an `i32` value but initiates the loop with an `f64` value on the stack. This tests if both implementations properly verify and enforce the stack unwinding up to the specified type.

(assert_invalid 
  (module (func
    (f64.const 0.0) 
    (loop (result i32) (i32.const 0) (br 0))
  ))
  "type mismatch"
)