;; 10. **Default Label Type Mistmatch**    - Design a `br_table` where the default label’s operand types mismatch one of the other branch targets to ensure that the default label consistency check is enforced accurately.

(assert_invalid
  (module
    (func $default-label-type-mismatch
      (block (br_table 0 (block (result i32) (i32.const 0)) (block (result i64) (i64.const 1)) (i32.const 2)))
    )
  )
  "type mismatch"
)