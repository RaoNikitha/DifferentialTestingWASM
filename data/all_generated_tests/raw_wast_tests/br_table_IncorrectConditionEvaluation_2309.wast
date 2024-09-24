;; 9. **Test 9**: Construct a block with multiple condition-checked branches midway using `br_if`, followed by a `br_table`, ensuring some branches should not be taken. Evaluate if failed condition checks lead to execution divergence between the engines.

(assert_invalid
  (module
    (func $test9
      (block
        (i32.const 0)
        (br_if 0 (i32.const 0))
        (i32.const 1)
        (br_if 0 (i32.const 1))
        (i32.const 2)
        (br_table 1 0 2 (i32.const 3))
      )
    )
  )
  "unknown label"
)