;; Develop a test where the default label is inside a deeply nested block, and the operand causes an out of bounds index. This will check the correct default branching target and how deep label indices affect resolution.

(assert_invalid
  (module
    (func $deep-nested-default
      (block
        (block
          (block
            (block
              (block
                (block
                  (block
                    (block
                      (br_table 0 1 2 3 4 5 6 7 8 (i32.const 50))
                    )
                  )
                )
              )
            )
          )
        )
      )
    )
  )
  "unknown label"
)