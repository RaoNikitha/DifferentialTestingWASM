;; 10. **Test Description**:    Set up a `block` instruction where the entry type matches, but include function calls inside the block that incorrectly return mismatching types. Check if the block correctly captures and handles such errors.    **Constraint**: Function call types and results within blocks should match block type.    **Relation**: Ensures functions inside blocks adhere to their input and output type specifications to prevent runtime inconsistencies.

(assert_invalid
  (module
    (func $mismatching-function-call
      (block (result i32)
        (call $foo) ; Suppose $foo returns f32 rather than i32
      )
    )
    (func $foo (result f32) (f32.const 1.0))
  )
  "type mismatch"
)