;; 8. Build a test incorporating nested blocks where one block captures a fall-through scenario, while a `return` within a nested block influences another branch. This tests block context management with early exits vs. natural fall-throughs in nested structures.

(assert_invalid
  (module
    (func $nested-blocks-return-test (result i32)
      (block $outer
        (block $inner
          (i32.const 0)
          (br_if $inner (i32.const 1))
          (return)
        )
        (i32.const 0)
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)