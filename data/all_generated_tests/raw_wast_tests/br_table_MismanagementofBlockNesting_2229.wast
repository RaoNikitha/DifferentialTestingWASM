;; 9. Develop a test where `br_table` is nested within conditional statements that themselves are nested within loops. This complex nesting ensures that the implementation correctly maintains control flow across multiple levels of nesting.

(assert_invalid
  (module
    (func
      (block
        (loop
          (if (i32.const 1)
            (then
              (loop
                (if (i32.const 0)
                  (then
                    (br_table 0 1 (i32.const 2))
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