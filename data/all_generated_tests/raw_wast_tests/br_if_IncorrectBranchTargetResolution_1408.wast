;; 9. **Test Description**: Develop a setup with multiple `loop` constructs, where a `br_if` in one targets a non-adjacent, outer `loop`. Verify if the correct loop is referenced.    - **Constraint Checked**: Identifying and targeting the correct `loop` in non-adjacent nestings.    - **Related Issue**: Proper label indexing for multiple nested loops with conditional branching.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (loop (result i32)
          (i32.const 0)
          (loop (result i32)
            (br_if 1 (i32.const 1))
          )
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)