;; 8. **Test with Overlapping Function Call Frame**:     - **Description**: Call a function in a scenario where the function frame overlaps with the previous call.     - **Constraint Checked**: Ensures correct maintenance and separation of function execution frames.     - **CFG Relation**: Tests the CFG’s handling of overlapping frames to ensure sound control flow and stack frame management.

(assert_invalid
  (module
    (func $func1 (call $func2))
    (func $func2 (call $func3))
    (func $func3 (call $func1))
    (func $start (call $func1))
    (start $start)
  )
  "unbounded recursion causing stack overflow"
)