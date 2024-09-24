;; 5. **Test Description**: Create a test where a function is called containing `br_if` instructions with conditions dependent on previous function results. Any incorrect evaluation leads to misalignment of results due to differing logical branches taken.

(assert_invalid
  (module
    (func $conditional-branch (result i32)
      (i32.const 0)
      (br_if 0 (call 1))
    )
    (func (result i32) (i32.const 1))
  )
  "type mismatch"
)