;; 3. **Test Description:** Perform a conditional branch with `br_if` to bypass a function call if the top stack value is zero. Ensure that a difference in condition evaluation between implementations results in incorrect branching and subsequent stack misalignment. Specific Constraint:** Evaluating stack value conditions.

(assert_invalid
  (module
    (func $conditional-call
      (i32.const 0)
      (br_if 0 
        (unreachable)
        (call 1)))
    (func (result i32))
  )
  "type mismatch"
)