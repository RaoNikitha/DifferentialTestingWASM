;; 1. **Nested Function Calls with Stack Overflow**:    - **Description**: Create a WebAssembly module with a deep chain of nested function calls where each function `A` calls `B`, and `B` calls `C`, and so on, ultimately causing a stack overflow.    - **Reason**: This tests the stack management and error handling differences when the function call depth exceeds the maximum stack size, potentially causing an infinite loop in error handling.

(assert_invalid
  (module
    (func $A (call $B))
    (func $B (call $C))
    (func $C (call $A))
    (func (export "main") (call $A))
  )
  "stack overflow"
)