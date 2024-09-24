;; 7. **Test 7: Incorrect Function Return Value Type within Loop**    - **Constraint:** Verify function return types and their impact on loop conditions.    - **Description:** Within a loop, call a function expected to return a specific type crucial for loop termination. A mismatch or error in the return type handling should result in an infinite loop.

(assert_invalid
  (module
    (func $type-loop-num-vs-num
      (loop (br_if 0 (call 1)))
    )
    (func (result f64) (f64.const 1.0))
  )
  "type mismatch"
)