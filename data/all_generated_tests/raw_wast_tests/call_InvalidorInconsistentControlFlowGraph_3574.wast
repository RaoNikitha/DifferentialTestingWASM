;; 3. **Function Call within Nested Control Structures**:    Write a test where a function call is placed within multiple nested blocks and conditional branches. This verifies if the CFG correctly follows through the nested layers without losing track of the call instruction and its expected argument and result types.

(assert_invalid
  (module
    (func $nested-function-call (param i32) (result i32)
      (block
        (loop
          (if (i32.const 1)
            (then
              (call 1 (i32.const 0))
            )
            (else
              (call 1 (i32.const 1))
            )
          )
        )
      )
    )
    (func (param i32) (result i32))
  )
  "type mismatch"
)