;; 10. Generate a `br_table` that targets labels defined within different levels of control instruction hierarchy, exceeding normal nesting depth, to affirm proper label indexing and structured control enforcement in deeply nested contexts.

(assert_invalid
  (module (func
    (block (result i32)
      (block (result i64)
        (block (block (block (block (block 
          (br_table 0 1 2 3 4 5 (i32.const 0) (i32.const 0))
        )))))
      )
    )
  ))
  "unknown label"
)