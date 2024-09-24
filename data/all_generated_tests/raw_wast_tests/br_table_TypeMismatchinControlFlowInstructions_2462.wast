;; 2. **Test Description**: Implement a loop with `i64` result type and use `br_table` to branch to a block expecting `i32` result type.

(assert_invalid
  (module
    (func $loop-type-mismatch
      (loop $loop (result i64)
        (block $block (result i32)
          (br_table $block $loop (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)