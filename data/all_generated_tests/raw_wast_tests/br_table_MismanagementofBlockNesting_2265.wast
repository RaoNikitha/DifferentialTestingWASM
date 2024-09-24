;; 5. Place a `br_table` in an outer block that contains nested loops and blocks, with the operand index intended to point to an innermost loop label. The test validates the correct nesting level handling and checking for mismanagement of inner block labels.

(assert_invalid
  (module
    (func
      (block
        (loop
          (block
            (block
              (br_table 2 0 (local.get 0))
            )
            (loop
              (block
                (br_table 1 0 (local.get 0))
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)