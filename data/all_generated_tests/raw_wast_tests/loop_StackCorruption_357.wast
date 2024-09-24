;; 8. **Test Exceeding Expected Stack Height in Loop**:    - Create a complex loop that pushes more values than expected onto the stack. Check for stack overflows or mismanagement.    - **Constraint**: Ensuring stack space is correctly allocated and managed during loop execution.    - **Relation to Stack Corruption**: Overflows can occur if the loop's stack growth exceeds limits, leading to corruption.

(assert_invalid
  (module (func $stack-height-exceed-loop
    (loop (block (block (i32.const 1) (i32.const 2) (i32.const 3) (i32.const 4) (i32.const 5) (br 2))))
  ))
  "type mismatch"
)