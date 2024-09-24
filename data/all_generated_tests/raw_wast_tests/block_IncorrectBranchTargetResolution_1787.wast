;; 8. **Mixed Block Types and Branching**: Implement blocks with varying block types (`valtype?` vs. `typeidx`) and complex branching. This tests if `wizard_engine` correctly resolves block types along with target branches.

(assert_invalid
  (module (func $invalid-block-type-mixed
    (block (result i32) 
      (block (type 0) (br 1 (i32.const 42)))
      (br 0)
    )
  ))
  "type mismatch"
)