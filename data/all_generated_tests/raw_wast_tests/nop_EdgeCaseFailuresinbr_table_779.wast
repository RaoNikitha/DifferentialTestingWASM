;; 10. Utilize extensive sequences of `nop` followed by a `br_table` with indices that push the limit of the target count boundaries (e.g., just within and just outside). Check if both WebAssembly and wizard_engine execute without anomalies or side effects.

(assert_invalid
  (module (func $extensive-nop-br_table
    (block $exit
      (loop $outer
        (nop) (nop) (nop) (nop) (nop)
        (nop) (nop) (nop) (nop) (nop)
        (br_table 0 1 0 1 0 1 0 1 0 1 (i32.const 0))
      )
    )
  ))
  "br_table target count out of bounds"
)