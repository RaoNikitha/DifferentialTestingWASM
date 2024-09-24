(assert_invalid
  (module (func $type-br_table-label-num-vs-label-void-after-unreachable
    (block
      (block (result f32)
        (unreachable)
        (br_table 0 1 0 (i32.const 1))
      )
      (drop)
    )
  ))
  "type mismatch"
)