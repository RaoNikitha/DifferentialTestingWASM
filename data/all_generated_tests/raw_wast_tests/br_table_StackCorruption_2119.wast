;; Test 9: Design a differential test with a `br_table` where the operand is dynamically calculated through a series of `i32.add` and `i32.mul` operations. Evaluate if intermittent stack manipulations cause any stack mismanagements or corrupt stack states in either implementation.

(assert_invalid
  (module
    (func $dynamic-calculation-br_table
      (block $outer
        (block $inner
          (i32.const 2)
          (i32.const 3)
          (i32.mul)
          (i32.const 4)
          (i32.add)
          (br_table 0 1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)