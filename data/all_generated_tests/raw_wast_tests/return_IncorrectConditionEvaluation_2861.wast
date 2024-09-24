;; 10. Use conditional operations within a `br_if` condition (e.g., using `i32.eq`) and ensure reliable evaluation. Deviation in branch path will indicate mismatches due to incorrect condition checks.

(assert_invalid
  (module
    (func $conditional-br_if-return (result i32)
      (i32.const 1)
      (br_if 0 (i32.eq (i32.const 1) (return)))
    )
  )
  "type mismatch"
)