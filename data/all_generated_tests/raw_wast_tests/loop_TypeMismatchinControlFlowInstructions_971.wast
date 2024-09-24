;; 2. **Test 2: Unmatched Operand and Result Types**    - Description: Create a loop instruction with a block type expecting no input but outputting an i32; have the enclosed instructions push an f32 onto the stack.    - Reasoning: This verifies that the stack unwinding and operand handling correctly enforce the expected input and output types of the loop block.

(assert_invalid
  (module (func $unmatched-operand-result-types
    (loop (result i32) (f32.const 1.0) (i32.const 0))
  ))
  "type mismatch"
)