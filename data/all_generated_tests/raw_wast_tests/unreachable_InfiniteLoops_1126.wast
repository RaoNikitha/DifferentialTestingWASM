;; 7. Define a loop that combines arithmetic operations and comparisons with control flow instructions such as `br` and `br_if`. Insert an `unreachable` in the middle of this loop under a specific condition. This helps reveal if control flows and arithmetic evaluations are terminated correctly by the unreachable instruction.

(assert_invalid
  (module (func $unreachable-in-loop
    (loop $loop
      (i32.const 3)
      (i32.const 4)
      i32.add
      (i32.const 0)
      br_if $loop
      unreachable
      (i32.const 5)
    )
  ))
  "type mismatch"
)