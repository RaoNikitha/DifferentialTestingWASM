;; 3. **Mixed Blocks and Loops with Conditional Exits:**    - Include a combination of loops and blocks where `br_table` targets conditional label indices based on the operand.    - Ensures that branching respects loop boundaries and exits accordingly without incorrectly unwinding the operand stack.

(assert_invalid
  (module (func
    (block (loop $loop1 (block (result i32) (block (result i32)
      (br_table 0 1 2 (i32.const 3))
    )))
  ))
  "unknown label"
)