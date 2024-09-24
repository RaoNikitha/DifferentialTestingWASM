;; 7. **Test Description:** Engineer a test involving a series of nested control constructs (`block`, `loop`, and `if`), where the default label of `br_table` defaults to the innermost block if indices fall out of expected range, ensuring control flow does not inadvertently escape all nested constructs.

(assert_invalid
  (module
    (func
      (block (result i32)
        (block (result i32)
          (i32.const 0)
          (loop
            (block (result i32)
              (i32.const 1)
              (br_table 1 0 (i32.const 2))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)