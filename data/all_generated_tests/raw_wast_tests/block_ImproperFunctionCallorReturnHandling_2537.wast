;; 8. **Test Bad Function Call Sequence in Block:**    - Implement a `block` that sequences multiple `call` instructions where the second call assumes an operand stack altered incorrectly by the first call.    - **Constraint:** Validates stack correctness and error handling between consecutive call instructions inside blocks.

(assert_invalid
  (module (func $test-bad-call-sequence-in-block
    (block (result i32)
      (call $first-func)
      (call $second-func) 
    )
  ))
  "type mismatch"
)