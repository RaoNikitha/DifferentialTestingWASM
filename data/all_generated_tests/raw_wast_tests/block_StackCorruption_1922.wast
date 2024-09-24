;; Test 3: A combination of several `block` instructions with interleaved `br_table` instructions that unconditionally branch to different points within the blocks. Ensure the stack maintains integrity and correctly reflects the block's stack height at each `br_table` target.

(assert_invalid
  (module
    (func $complex-br-table-test
      (block $block1 (result i32)
        (i32.const 10)
        (block $block2
          (block $block3
            (i32.const 0)
            (br_table 0 1 2)
            (i32.const 1)
          )
          (i32.const 2)
        )
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)