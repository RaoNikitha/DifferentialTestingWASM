;; 7. **Test 7**: Try branching (using `br`) to a block label expecting `f32` values, but perform the branch in a context where `i32` values are at the top of the stack. This confirms whether different stack types are correctly reconciled upon branching.

(assert_invalid
  (module
    (func $type-br-mismatch (result f32)
      (block (result f32) (br 0 (i32.const 1)))
    )
  )
  "type mismatch"
)