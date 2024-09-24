;; - Test 3: Utilize `br_table` with an index that exceeds the number of targets by one. This tests the boundary condition to ensure it safely defaults to the fallback label without leading to undefined behavior.

(assert_invalid
  (module
    (func $br_table_boundary
      (block
        (br_table 0 1 (i32.const 2))
      )
      (i32.const 1) (drop)
    )
  )
  "unknown label"
)