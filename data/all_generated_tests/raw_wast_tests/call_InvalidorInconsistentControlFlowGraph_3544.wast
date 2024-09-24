;; 3. **Test with Recursive Function Call Chain**:     - **Description**: Create a chain of recursive function calls that eventually exceeds the maximum call stack depth.     - **Constraint Checked**: Checks for proper stack depth management and error trapping in recursive calls.     - **CFG Relation**: Investigates how the CFG manages deep recursion and stack overflows, ensuring proper preservation and restoration of the execution state.

(assert_invalid
 (module
  (func $recursive-call-1 (call $recursive-call-2))
  (func $recursive-call-2 (call $recursive-call-1))
  (start $recursive-call-1)
 )
 "call stack exhausted"
)