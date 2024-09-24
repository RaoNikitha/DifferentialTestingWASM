;; 3. **Test Case 3: Conditional Call to Imported Function with Unreachable**    - **Description:** In Module A, call an imported function from Module B conditionally based on a local variable. Module B's function should immediately execute `unreachable`. This ensures that conditional branching and the trap are correctly handled across module boundaries.

(assert_invalid
  (module
    (import "modB" "funcB" (func $funcB))
    (func $test (local i32) (if (local.get 0) (then (call $funcB))))
  )
"unreachable executed: conditional call to imported function"
)