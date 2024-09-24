;; 7. **Unreachable Instruction After Multiple Sequential Imports:**    - Use multiple sequentially imported functions followed by an `unreachable` in the caller module. Check if the imported function calls and trap after all imports maintain correct control flow.    - **Constraint:** Ensure all called imported functions complete correctly and the `unreachable` right after all imports causes an immediate trap, verifying control flow consistency.

(assert_invalid
  (module
    (import "env" "imported_func1" (func))
    (import "env" "imported_func2" (func))
    (import "env" "imported_func3" (func))
    (func (unreachable) (call 0) (call 1) (call 2))
  )
  "unknown function"
)