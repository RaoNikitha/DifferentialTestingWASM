;; 1. **Test Description 1:**    An indirect branch using `br_table` with the index equal to the number of available targets, exactly on the boundary. This tests handling of the upper boundary condition to ensure proper bounds checking.

(assert_invalid
  (module (func $boundary-br-table
    (block (block (br_table 0 1 (i32.const 2))))
  ))
  "unknown label"
)