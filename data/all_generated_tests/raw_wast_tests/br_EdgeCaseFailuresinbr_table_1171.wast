;; 2. Test a `br_table` instruction with the maximum possible index value for the current WebAssembly configuration, to ensure that the handling of this index does not exceed or misinterpret the bounds of available labels.

(assert_invalid
  (module
    (func
      (block
        (block
          (block
            (block
              (br_table 0 1 2 3 0 (i32.const 0))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)