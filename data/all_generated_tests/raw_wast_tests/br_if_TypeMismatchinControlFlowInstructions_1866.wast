;; - **Test 7**:   A block containing a misconfigured `br_if` where the parameter for the branch condition is a `f32` instead of an `i32`, causing a type mismatch.   - **Reason**: Ensures branches conditionally executed are correctly typed.   - **Constraint**: `br_if` must be provided an `i32` condition.

(assert_invalid
  (module (func $type-true-f32 (block (br_if 0 (f32.const 1.0)))))
  "type mismatch"
)