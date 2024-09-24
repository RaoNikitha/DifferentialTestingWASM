;; Test 9: A deeply nested control flow with loops and backward `br` instructions targeting outermost loops. Mislabeling these targets will cause unexpected looping behavior or infinite loops.

(assert_invalid
  (module
    (func $deeply_nested_loops
      (result i32)
      (i32.const 0)
      (loop (result i32)
        (loop (result i32)
          (br 2) 
          (drop)
        )
      )
    )
  )
  "unknown label"
)