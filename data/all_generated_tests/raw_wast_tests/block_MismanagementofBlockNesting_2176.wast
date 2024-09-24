;; 7. **Test Description**:    Set up a nested block environment where the innermost block tries to use a local jump (`br`) to exit an `outer` block context but due to miscounting labels potentially resolves to an incorrect outer block. Validate if both environments correctly count label indices and manage such context changes.

(assert_invalid
  (module (func $type-nested-block-br (result i32)
    (block (result i32)
      (block (result i32)
        (br 1 (i32.const 42))
      )
      (i32.const 0)
    )
  ))
  "type mismatch"
)