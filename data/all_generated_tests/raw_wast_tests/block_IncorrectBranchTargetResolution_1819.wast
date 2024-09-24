;; 10. **Test Description**: Create a structured block with explicitly erroneous branch indices that exceed the available labels. This should test the robustness of branch target validations in detecting out-of-bounds indices and preventing erratic jumps.

(assert_invalid
  (module (func $type-out-of-bounds-branch
    (block (result i32) (br 1))
  ))
  "unknown label"
)