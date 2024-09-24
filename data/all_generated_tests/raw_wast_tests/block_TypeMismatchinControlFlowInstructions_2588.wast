;; 9. Design a `block` using a `br_table` that redirects to branches with varying expected types (`i64` and `f64`), focusing on whether the branching properly adheres to type correctness.

(assert_invalid
  (module (func $block-br_table-type-mismatch (result i64) 
    (block (result i64)
      (br_table 0 1 
        (i32.const 0) 
        (block (result f64) (f64.const 1.0))
        (block (result i64) (i64.const 1))
      )
    )
  ))
  "type mismatch"
)