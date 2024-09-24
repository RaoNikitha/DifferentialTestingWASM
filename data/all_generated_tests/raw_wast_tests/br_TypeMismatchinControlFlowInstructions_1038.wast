;; Test 9: Build a complex nested structure with multiple labels. Use br to incorrectly reference and branch to a label that expects different operand types, causing a type mismatch error.

(assert_invalid
  (module
    (func $test
      (block (result i32) 
        (block (result i64) 
          (br 1 (i32.const 1))
        )
      )
    )
  )
  "type mismatch"
)