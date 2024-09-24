;; Test 2: A `br_table` that references multiple loops at different nesting levels. Incorrect branch resolution will cause it to jump to the wrong loop, leading to skipped iterations or an infinite loop.

(assert_invalid
  (module
    (func $test
      (block
        (loop $outer (result i32)
          (i32.const 0)
          (block
            (loop $inner (result i32)
              (i32.const 1)
              (br_table 1 0)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)