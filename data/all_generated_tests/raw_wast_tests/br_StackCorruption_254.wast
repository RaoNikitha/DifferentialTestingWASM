;; 5. **Test 5: Operand Stack Overflow Handling**    - A scenario where `br` instructions are used in a way that causes the operand stack to grow substantially, testing the limits of stack capacity.    - Constraint: Verify that the implementation correctly handles large operand stack without spilling data.    - Stack Corruption Check: Ensure no overflow corrupts the stack data structure.

(assert_invalid
  (module (func $operand-stack-overflow (block (loop (br 0) (i32.const 0) (drop)))))
  "operand stack overflow"
)