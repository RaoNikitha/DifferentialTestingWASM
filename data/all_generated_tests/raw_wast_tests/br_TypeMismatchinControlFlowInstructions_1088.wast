;; 9. Create a differential test where an incorrectly indexed `label` in a `br` results in a type error because it points to a structured control instruction with different operand requirements. This ensures labels are correctly resolved and types are validated.

(assert_invalid
  (module
    (func (param i32) (result i32)
      (block (result i32)
        (block (result f32)
          (br 1 (f32.const 1.0))
        )
      )
    )
  )
  "type mismatch"
)