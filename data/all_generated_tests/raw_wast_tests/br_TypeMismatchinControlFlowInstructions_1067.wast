;; 8. **Test for Type Mismatch on Indirect Branch Handling:**    Use the `br_table` instruction to branch to different blocks with varying types, ensuring that the target block consuming mismatching types causes a validation error, testing the robustness of the type check.

(assert_invalid
  (module
    (func $test-type-mismatch-br_table
      (block $label0 (result i32)
        (br_table $label0 (block $label1 (result f32) (i32.const 10)))
       )
    )
  )
  "type mismatch"
)