;; 8. Test a `br_table` with duplicative label targets and out-of-bound indices, embedding `nop` before and after each `br_table`. This is to verify if `nop` causes any disruptions in homogeneous label target processing in `br_table`.

(assert_invalid
  (module
    (func $test_br_table
      (block $l0
        (block $l1
          (block $l2
            (nop)
            (br_table $l0 $l0 $l1 $l2 (i32.const 3))
            (nop)
          )
        )
      )
    )
  )
  "type mismatch or out-of-bound index"
)