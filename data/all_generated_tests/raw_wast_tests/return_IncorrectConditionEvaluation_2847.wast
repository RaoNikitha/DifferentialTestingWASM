;; 6. Write a function that uses a `br_table` switch-case-like structure with conditions leading to various blocks, some with `return` statements. Test each case to ensure they precisely evaluate conditions and reach the correct return statements.

(assert_invalid
  (module
    (func $br_table_with_return (param i32) (result i32)
      (i32.const 0)
      (block $outer
        (block $case0 (br_table $case0 $case1 $case2 $default (local.get 0)))
        (block $case1 (drop (return (i32.const 1))))
        (block $case2 (return (i32.const 2)))
        (block $default (return (i32.const 3)))
      )
      (return (i32.const 4))
    )
  )
  "type mismatch"
)