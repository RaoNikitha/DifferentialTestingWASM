;; 5. **Loop with Stack Underflow**:    - **Description**: Test a loop where the operand stack underflows, such as by using more operands than are provided.    - **Constraint Checked**: Ensures proper stack management and unwinding up to the correct height.    - **Relation to CFG**: Incorrect stack management can lead to invalid state transitions within the CFG.

(assert_invalid
  (module
    (func $loop_with_stack_underflow
      (i32.const 1)
      (loop (param i32 i32) (drop) (drop))
    )
  )
  "type mismatch"
)