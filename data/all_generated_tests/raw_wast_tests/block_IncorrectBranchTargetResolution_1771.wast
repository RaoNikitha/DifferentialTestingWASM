;; 2. **Multiple Level Branching**:    Create a scenario with multiple levels of nested blocks, and use `br_table` to jump to various outer blocks. Ensure that the target resolution is consistent and correct across both implementations.

(assert_invalid
  (module (func $multiple-level-branching (result i32)
    (block (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 1 2 (i32.const 0)))));
    i32.const 1))
  "type mismatch"
)