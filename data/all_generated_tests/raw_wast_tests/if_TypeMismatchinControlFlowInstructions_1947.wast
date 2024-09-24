;; 8. A well-nested `if-else` sequence where the parent block expects a return type `i64` but the nested `else` block ends with an `i32`, causing stack type inconsistencies.

(assert_invalid
  (module (func $type-else-value-nested-mismatch (result i64)
    (block (if (result i64) (i32.const 1)
      (then (i64.const 0))
      (else (i32.const 0))
    ))
  ))
  "type mismatch"
)