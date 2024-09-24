;; 1. **Test Description:**    - **Edge Case:** Outside range index for `br_table`.    - **Constraint Checked:** Ensuring `unreachable` correctly traps when `br_table` uses an out-of-bounds index.    - **Details:** A `br_table` pointing to multiple valid labels, followed by `unreachable`. Use an index that exceeds the available target count to see if `unreachable` triggers a proper trap.

(assert_invalid
  (module 
    (func $test-unreachable-with-br_table 
      (block 
        (block 
          (block 
            (block 
              (br_table 0 1 2 3 (i32.const 4)) 
              (unreachable))))
      )
    )
  )
  "type mismatch"
)