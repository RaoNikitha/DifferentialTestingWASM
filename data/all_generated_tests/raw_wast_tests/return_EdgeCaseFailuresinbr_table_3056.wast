;; Insert a `br_table` with boundary-worthy index just inside valid range but within a deeply nested block structure to test how both implementations manage nested block contexts and operand stack correctness.

(assert_invalid
  (module
    (func $deep-nesting-br_table (param i32) (result i32)
      (block (result i32)
        (block (result i32)
          (loop (result i32)
            (block (result i32)
              (block (result i32)
                (block (result i32)
                  (block (result i32)
                    (br_table 0 1 (return) (i32.const 0))
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "type mismatch"
)