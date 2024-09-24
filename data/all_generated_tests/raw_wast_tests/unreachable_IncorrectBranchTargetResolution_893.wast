;; 4. **Test Unreachable in Nested Loops:** Create two nested loops, and place `unreachable` inside the inner loop. Check if `br` instructions within the inner loop properly exit to the corresponding loop based on the appropriate labels, confirming correct branch resolution.

(assert_invalid
  (module (func $test-unreachable-nested-loops
    (loop (result i32)
      (loop (result i32) 
        (unreachable)
        (br 1) (i32.const 0)
      )
      (br 1) (i32.const 1)
    )
  ))
  "type mismatch"
)