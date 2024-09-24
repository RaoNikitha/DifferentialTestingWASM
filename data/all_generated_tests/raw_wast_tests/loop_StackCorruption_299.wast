;; - **Test 10**: Establish a loop that initiates and subsequently aborts complex computations using `br_if` branches conditional on the stack's state. Variations in input should lead to different stack manipulations, but the stack should never become corrupted or leave residual values upon reentry.

(assert_invalid
  (module (func (result i32)
    (i32.const 1)
    (loop (param i32) (result i32)
      (br_if 0 (i32.const 0))
      (drop)
      (i32.const 2) (call 0)
    )
  ))
  "type mismatch"
)