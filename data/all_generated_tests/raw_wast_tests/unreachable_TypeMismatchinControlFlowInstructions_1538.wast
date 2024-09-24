;; 9. Include `unreachable` within a function that switches between producing `i32` and `i64` values across control flow paths. Ensure the engines detect type mismatches when exiting control flow structures.

(assert_invalid
  (module (func $type-switch-value-mismatch
    (block (i32.const 1) (unreachable)) (i64.const 0)
  ))
  "type mismatch"
)