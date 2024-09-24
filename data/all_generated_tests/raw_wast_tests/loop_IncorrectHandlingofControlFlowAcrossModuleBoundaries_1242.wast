;; 3. **Test: Loop with Direct Call to Multiple Imported Functions**    Description: Create a loop that directly calls multiple imported functions sequentially. Verify the control flow returns to the loop after each function call and the operand stack is appropriately managed.    Constraints:    - Ensure proper stack unwinding and rewinding for each function call.    - Validate that operand types conform to the loop's requirements.    - Verify consistency in result types across module boundaries.

(assert_invalid
  (module
    (import "env" "func1" (func $func1 (param i32) (result i32)))
    (import "env" "func2" (func $func2 (param f64) (result f64)))
    (func (loop (result i32 f64)
      (call $func1 (i32.const 1))
      (call $func2 (f64.const 2.0))
      (br 0)
    ))
  )
  "type mismatch"
)