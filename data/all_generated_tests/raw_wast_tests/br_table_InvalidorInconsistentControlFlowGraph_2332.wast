;; 2. Construct a deeply nested block structure where `br_table` targets a mixture of inner and outer blocks. Include an invalid relative label index that points beyond the enclosing structure, causing the `br_table` to reference an invalid label. This checks the handling of label indexing and CFG validity in nested contexts.

(assert_invalid
  (module
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (block (result i32)
              (br_table 0 1 2 3 4 5 (i32.const 6)) (i32.const 0)
            )
          )
        )
      )
    )
  )
  "unknown label"
)