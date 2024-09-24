;; 10. **Test 10: BrTable in Loop with Function Calls**    - Construct a test placing a `br_table` inside a loop where labels lead to function calls with differing arities. The loop context should aggravate arity mismatches, pushing the implementation’s handling of such errors under repetitive branch scenarios.

(assert_invalid
  (module
    (func $test
      (block $default
        (loop $loop
          (i32.const 2)
          (br_table 0 1 $default)
          (call $func1)
          (br $loop)
        )
      )
    )
    (func $func1 (param i32) (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)