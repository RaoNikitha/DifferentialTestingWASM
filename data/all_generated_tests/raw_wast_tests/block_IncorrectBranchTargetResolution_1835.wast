;; 6. **Backward Incorrect Branch inside a Block**:    - Design a `block` with nested instructions and an incorrect label targeting an earlier nested block, causing a backward jump.    - Validate that branches are always outward, ensuring the implementation catches and handles these errors appropriately.

(assert_invalid
  (module (func $backward-branch
    (block (block (br 1)))
  ))
  "invalid branch target"
)