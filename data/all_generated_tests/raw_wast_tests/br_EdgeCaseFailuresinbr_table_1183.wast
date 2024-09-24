;; - Test a `br_table` with an index that is exactly zero to verify if it targets the first label correctly.

(assert_invalid
  (module
    (func $br-table-with-zero-index
      (block $label0
        (i32.const 0)
        (br_table 0 $label0)
        (i32.const 1)
        (br $label0)
      )
    )
  )
  "type mismatch"
)