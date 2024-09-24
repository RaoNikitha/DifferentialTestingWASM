;; 3. **Test Description**: Include `nop` inside a loop that interacts with an imported function, verifying the loop's execution remains consistent regardless of `nop`.    - **Constraint**: Ensure `nop` does not interfere with loop control flow or function import behavior.    - **Relates to**: Ensures loops with cross-module interactions remain stable with `nop`.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (loop (nop) (call $external_func) (br 0)))
  )
  "type mismatch"
)