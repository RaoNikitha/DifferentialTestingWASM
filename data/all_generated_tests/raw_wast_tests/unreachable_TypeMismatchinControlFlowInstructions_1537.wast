;; 8. Construct a block with an unreachable instruction that returns `f64`, and follow it with misaligned `i32`-producing instructions. Examine if the misalignment is correctly identified and causes the right traps.

(assert_invalid
  (module (func $test
    (block (result f64) 
      unreachable
    )
    (i32.const 10) (i32.const 20)
    (i32.add)
  ))
  "type mismatch"
)