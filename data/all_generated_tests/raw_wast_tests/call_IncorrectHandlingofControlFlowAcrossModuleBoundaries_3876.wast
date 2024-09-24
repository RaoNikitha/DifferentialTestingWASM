;; 5. **Arity Mismatch on Function Export Call**:    - **Constraint Checked**: Ensures exported functions handle argument count mismatches.    - **Description**: Export a function from module A that requires five arguments. Import and call this function in module B with four arguments. Test if the engines correctly detect and handle the arity mismatch, focusing on stack recovery and error trapping.

(assert_invalid
  (module
    (import "A" "funcFiveArg" (func (param i32 i32 i32 i32 i32)))
    (func (call 0 (i32.const 1) (i32.const 2) (i32.const 3) (i32.const 4)))
  )
  "type mismatch"
)