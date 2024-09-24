;; 3. Implement a recursive function in one module and export it. In a second module, import the recursive function and call it with different arguments to test the depth of recursion handling. This checks if the control flow maintains the correct call stack frame across module boundaries.

(assert_invalid
 (module
  (import "env" "recursive" (func $recursive (param i32) (result i32)))
  (func $test-recursion
   (call $recursive (i32.const 10))
  )
 )
 "call stack overflow"
)