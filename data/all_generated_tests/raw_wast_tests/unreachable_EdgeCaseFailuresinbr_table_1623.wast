;; 4. Have multiple `br_table` instructions targeting different blocks that end with `unreachable`, inducing a scenario where the `br_table` index dynamically selects between hitting an `unreachable` and a valid branch. This tests if `br_table` correctly identifies when to trap due to `unreachable`.

(assert_invalid
  (module (func $multi-br_table-with-unreachable
    (block $block1
      (block $block2
        (block $block3 
          (br_table 0 1 2 (i32.const 0) (unreachable))
        )
        (br_table 0 1 2 (i32.const 1) (i32.const 42))
      )
      (br_table 0 1 2 (i32.const 2) (i32.const 21))
    )
  ))
  "type mismatch"
)