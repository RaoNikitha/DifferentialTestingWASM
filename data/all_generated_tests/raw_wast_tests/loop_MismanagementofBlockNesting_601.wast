;; 2. Design a nested structure with a loop inside a conditional block, where the loop contains multiple backward branches (`br`) to test correct reinitialization and execution of the loop. Verify if the branches correctly unwind the operand stack and restart the loop.

(assert_invalid
  (module (func $nested-loop-conditional
    (result i32)
    (i32.const 10)
    (if (result i32)
      (i32.const 1)
      (loop (result i32)
        (br 0) ;; branch back to the start of the loop
        (br 0) ;; another branch back to the start of the loop
      )
    )
  ))
  "type mismatch"
)