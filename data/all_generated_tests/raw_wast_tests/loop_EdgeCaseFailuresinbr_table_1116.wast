;; - **Test 7**: Incorporate a `br_table` inside a loop where all table targets lead to different nested loops. Provide an exceedingly large index to check if the engines can detect the out-of-bounds index and handle the br_table’s default behavior.

(assert_invalid
  (module
    (func $br_table-out-of-bounds
      (loop $outer
        (block $nested1
          (block $nested2
            (block $nested3
              (br_table $outer $nested1 $nested2 $nested3 (i32.const 4))
            )
          )
        )
      )
    )
  )
  "unreachable"
)