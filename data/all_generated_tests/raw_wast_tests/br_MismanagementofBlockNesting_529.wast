;; 10. Create a scenario with multiple nested `blocks` and use a `br` instruction in an innermost block to jump to an intermediate block. Ensure the control correctly resumes after the intermediate block's `end`. This checks proper branch behavior from deeply nested inner blocks targeting intermediate levels.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (br 1)
          )
          (i32.const 42)
        )
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)