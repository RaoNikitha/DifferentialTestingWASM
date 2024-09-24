;; 9. **Test for Type Mismatch in Conditional Branches Within Loop**: Design a loop containing nested conditional branches (`br_if`) where the branch taken results in a different type being pushed onto the stack compared to what the loop expects.

(assert_invalid
  (module (func 
    (loop (result i32) 
      (i32.const 0)
      (br_if 0 (i32.const 1))
      (i64.const 2)
      (br 1))
      (end)
  ))
  "type mismatch"
)