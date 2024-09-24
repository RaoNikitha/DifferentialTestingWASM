;; 4. **Test 4: Recursive Function Calling Itself with Mismatched Parameters**      Description: Create a recursive function that calls itself with an incorrect number of parameters, testing whether the implementations can identify recursion depth and manage the stack correctly.      Constraint: Parameters passed during the recursive call should be fewer than required by the function signature.      Relation to Branch Target Resolution: Properly resolving recursive calls is critical for branch targets; errors may cause infinite recursion or incorrect call stack unwinding.

(assert_invalid
  (module
    (func $recursive-call-mismatch (param i32 i32)
      (call $recursive-call-mismatch (i32.const 5))
    )
  )
  "type mismatch"
)