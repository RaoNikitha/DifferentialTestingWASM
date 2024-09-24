;; Construct a multitiered switch-case-like logic using a sequence of `br_table` instructions with various conditions leading to different blocks. Embed `unreachable` in a block that should be unreachable, testing for erroneous condition evaluations resulting in unexpected traps.

(assert_invalid
  (module
    (func $type-br_table-unreachable 
      (block $block0
        (block $block1
          (block $block2
            (block $block3
              (block $block4
                (br_table 0 1 2 3 4 (i32.const 5))
                (unreachable)
              )
              (i32.const 0)
            )
            (i32.const 1)
          )
          (i32.const 2)
        )
        (i32.const 3)
      )
      (i32.const 4)
    )
  )
  "type mismatch"
)