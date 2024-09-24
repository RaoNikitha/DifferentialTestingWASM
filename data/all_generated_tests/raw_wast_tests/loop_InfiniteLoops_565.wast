;; 6. **Test Name: Conditional Branch Default Path Infinite Loop**    - **Description**: Implement a loop where a `br_table` with an out-of-bounds index results in the default branch targeting the beginning of the loop, causing an infinite loop.    - **Constraint Checked**: Validity of default path handling in `br_table` within loops.    - **Infinite Loop Relation**: Out-of-bounds condition always triggers the infinite default branch.

(assert_invalid
  (module
    (func $conditional_branch_default_path_infinite_loop
      (loop $loop (block $default (br_table $default $default (i32.const 1)) (br $loop)))
    )
  )
  "unreachable"
)