;; 6. **Test Case 6**:    - **Description**: Create a nested `loop` inside a `block`, where the `loop` expects an `f64` type but the `block` contains a `br_if` to the `loop` with a mismatched input type.    - **Constraint**: Verifies if the `br_if` correctly recognizes and handles target block types, ensuring stack unwinding aligns with the block's requirements.

(assert_invalid
  (module
    (func $test-case-6
      (block
        (loop (result f64)
          (br_if 1 (i32.const 1)) ;; Mismatched input type, expects f64 but provided i32
        )
      )
    )
  )
  "type mismatch"
)