;; 6. Construct a scenario with multiple `br_if` instructions each targeting different levels of nested blocks and loops. Verify whether each `br_if` correctly resolves the branch target labels within complex nested structures.

(assert_invalid
  (module
    (func $nested-br_if (result i32)
      (block (result i32)
        (block (result i32)
          (block
            (br_if 2 (i32.const 0))
            (br_if 1 (i32.const 1))
            (i32.const 0)
          )
          (i32.const 1)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)