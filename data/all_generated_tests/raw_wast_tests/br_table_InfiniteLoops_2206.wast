;; 6. **Test Description:** Create a test with a `br_table` that has nested loops with multiple branches, but one incorrect label index. Check if `wizard_engine` correctly identifies `BrTableArityMismatch` and halts, while WebAssembly handles the exception.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block
            (br_table 0 1 2 (i32.const 3))
          )
        )
      )
    )
  )
  "unknown label"
)