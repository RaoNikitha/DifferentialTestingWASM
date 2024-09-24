;; 8. Implement a test where `br_table` is used in a deeply nested structure, ensuring operand type sequences match from the innermost to outermost block, testing for stack alignment issues.

(assert_invalid
  (module
    (func (param i32 i32) (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (block (result i32)
                (br_table 1 0 0 (i32.const 0) (local.get 0))
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)