(assert_invalid
  (module (func $meet-bottom (param i32) (result externref)
    (block $l1 (result externref)
      (drop
        (block $l2 (result i32)
          (br_table $l2 $l1 $l2 (ref.null extern) (local.get 0))
        )
      )
      (ref.null extern)
    )
  ))
  "type mismatch"
)