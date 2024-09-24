;; 6. **Test Function Call within Loop Not Returning Properly**:    Validate a loop calling a function that never triggers a break condition correctly, leading to infinite loop execution.

(assert_invalid
  (module
    (func $inf-loop-call (result i32)
      (loop (result i32)
        (call $dummy-fn)
        br 0))
    (func $dummy-fn (result i32)
      i32.const 1)
  )
  "type mismatch"
)