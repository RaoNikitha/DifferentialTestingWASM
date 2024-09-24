;; 4. **Test Case 4: Multiple Function Imports, One with Unreachable**    - **Description:** Import multiple functions from Module B into Module A. Only one of the functions in Module B contains `unreachable`. Test if the correct traps are raised for the right functions and if control flow handles other imported functions correctly.

(assert_invalid
  (module
    (import "B" "func1" (func))
    (import "B" "func2" (func))
    (import "B" "func3" (func))
    (func $test 
      (call 0)
      (call 1)
      (call 2)
      (unreachable)
    )
  )
  "type mismatch"
)