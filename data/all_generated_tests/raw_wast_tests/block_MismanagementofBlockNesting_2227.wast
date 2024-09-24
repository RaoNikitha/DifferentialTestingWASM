;; 8. **Test 8: Complex Nesting with Return Values**    - **Description:** Nested blocks where each block produces different types of return values, and the innermost block branches out to the outermost with mismatched return types.    - **Constraint:** Ensures the alignment of the stack state and return type matching for nested block branching.    - **Mismanagement Check:** Tests misalignment in return types and incorrect stack handling due to branching.

(assert_invalid
  (module (func $complex-nesting-with-return-values
    (block (result i64)
      (block (result i32)
        (block (result f32)
          (br 2 (i32.const 10))
        )
      )
    )
  ))
  "type mismatch"
)