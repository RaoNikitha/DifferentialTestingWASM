;; Test 8: Utilize `br_table` inside a function where the index points to labels defined outside the function boundaries, ensuring the implementation captures the context correctly across function calls.

(assert_invalid
  (module
    (func $test-br_table-across-functions
      (block (result i32)
        (call $func2)
        (br_table 0 (i32.const 0))
      )
    )
    (func $func2
      (br_table 1 (i32.const 1))
    )
  )
  "invalid branch index"
)