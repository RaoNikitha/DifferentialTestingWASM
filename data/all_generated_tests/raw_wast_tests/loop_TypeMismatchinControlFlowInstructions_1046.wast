;; Test 7: A `loop` terminating with a `br_table` where the table targets have inconsistent result types, e.g., some targets produce `i32` while others produce `f32`. This test checks the correct enforcement of uniform type constraints across all potential branch destinations within a loop.

(assert_invalid
  (module
    (func $type-inconsistent-br_table (result i32)
      (loop (result i32)
        (i32.const 0) 
        (br_table 0 1 (i32.const 1) (f32.const 1.0))
      )
    )
  )
  "type mismatch"
)