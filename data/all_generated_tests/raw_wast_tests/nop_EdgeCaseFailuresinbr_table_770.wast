;; 1. Create a function with a sequence of `nop` instructions followed by `br_table` with a very large index exceeding the number of available targets. Check if both environments handle the out-of-bounds index correctly without any side effects from the `nop` instructions.

(assert_invalid
  (module
    (func $test
      (nop)
      (nop)
      (br_table 0 1 2 3 1000000)
    )
  )
  "index out of bounds"
)