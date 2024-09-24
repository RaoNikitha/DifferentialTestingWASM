;; 10. Create a nested loop structure with `br_table` instructions inside each loop, using boundary indices to test if the correct loop (inner or outer) is being accurately targeted, specifically when the index approaches or meets the limit of available labels.

(assert_invalid
  (module
    (func $nested-loops
      (loop
        (loop
          (block
            (br_table 0 1 2 (i32.const 3))
          )
        )
      )
    )
  )
  "unknown label"
)