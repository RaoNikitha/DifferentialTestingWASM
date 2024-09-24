;; 6. Write a loop where backward branches (`br`) have invalid or mismatched stack unwinding behavior, challenging correct operand consumption and CFG reconciliation.

(assert_invalid
  (module (func $invalid-loop-stack-unwind
    (i32.const 1) (i32.const 2) (loop (result i32) (br 0))
  ))
  "type mismatch"
)