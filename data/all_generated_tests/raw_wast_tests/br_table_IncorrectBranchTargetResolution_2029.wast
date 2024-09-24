;; Design a complex test scenario with multiple `br_table` calls across different functions and nested calls. This tests the resolution correctness across function boundaries and context maintenance while resolving branch targets in deep call stacks.

(assert_invalid
  (module
    (func $nested-br-table-1
      (block $outer (result i32)
        (block $inner (result i32)
          (call $nested-br-table-2)
          (br_table $inner $outer (i32.const 0) (i32.const 1))
        )
        (i32.const 2)
      )
    )
    (func $nested-br-table-2 (result i32)
      (block $inner1 (result i32)
        (block $inner2 (result i32)
          (br_table $inner2 $inner1 (i32.const 0) (i32.const 1))
          (call $nested-br-table-3)
        )
        (i32.const 3)
      )
      (i32.const 4)
    )
    (func $nested-br-table-3 (result i32)
      (block $loop
        (loop
          (br_table $loop (i32.const 2) (i32.const 1))
        )
        (i32.const 5)
      )
      (i32.const 6)
    )
  )
  "unknown label"
)