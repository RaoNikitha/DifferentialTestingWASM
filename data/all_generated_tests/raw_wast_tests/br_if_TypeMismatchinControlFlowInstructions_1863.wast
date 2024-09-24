;; - **Test 4**:   Implement a `block` with multiple branches and `br_if` instructions where one of the branches incorrectly alters the type stack by pushing an unexpected type (e.g., `i64` instead of expected `f32`).   - **Reason**: Tests if branches within the same block maintain consistent type expectations.   - **Constraint**: All branches must conform to the same type requirements defined by the block.

(assert_invalid
  (module
    (func $test (block (result f32)
      (br_if 0 (i32.const 1) (i64.const 42))
      (f32.const 1.0)
    ))
  )
  "type mismatch"
)