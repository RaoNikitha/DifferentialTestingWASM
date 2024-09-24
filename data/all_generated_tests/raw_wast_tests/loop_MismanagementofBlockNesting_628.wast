;; 9. **Loop with Interleaved Blocks**: Create a test with loops containing interleaved and nested `block` structures, with branches targeting both `blocks` and `loops`. This evaluates how well the implementation understands and processes nested and interleaved control structures, ensuring proper label scope management.

(assert_invalid
  (module
    (func $loop_interleaved_blocks
      (block $main
        (loop $outer (param i32) (result i32)
          (i32.const 0)
          (loop $inner (result i32)
            (i32.const 1)
            (br $outer)
          )
          (br $main)
        )
      )
    )
  )
  "type mismatch"
)