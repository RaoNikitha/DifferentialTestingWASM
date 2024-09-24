;; 5. **Test 5: Function Return Type Mismatch with Unreachable**    - A function that incorporates an `unreachable` within its control flow, leading to a type mismatch with the function’s declared return type.    - **Constraint Checked:** Ensures the function-level type consistency even in the presence of `unreachable` within its control flow branches.

(assert_invalid
  (module (func $type-mismatch-with-unreachable (result i32)
    (block (unreachable))
  ))
  "type mismatch"
)