;; 5. Implement a `loop` where nested blocks have type mismatches, such as a `br_if` targeting the loop with an incorrect stack type. This tests the handling of conditional branches regarding the loop's type constraints.

(assert_invalid
  (module
    (func $type_value_mismatch_in_loop
      (i32.const 0)
      (loop (result i32) 
        (br_if 0 (i64.const 1))
        (i32.const 1)
      )
    )
  )
  "type mismatch"
)