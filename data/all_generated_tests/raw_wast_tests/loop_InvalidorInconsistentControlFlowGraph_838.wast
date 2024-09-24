;; 9. Generate a loop block whose reinitialization disrupts the expected sequence, resulting in a disagreement on restarting execution within implementations, stressing handling of loop reinitialization.

(assert_invalid
  (module (func $test-loop-reinit (result i32)
    (loop (result i32)
      (br 0) 
      (i32.const 1)
    )
    (i32.const 0)
  ))
  "loop reinitialization with unreachable code"
)