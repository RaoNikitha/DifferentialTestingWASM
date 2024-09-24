;; 7. **Test Description**: Implement a `loop` with multiple `if` conditions, each containing a `call_indirect` instruction leading to different functions with specific return types.    - **Constraint**: Ensures that conditionally executed indirect calls within a loop properly handle returns based on different branches.    - **Improper Handling**: Incorrect conditional handling causing invalid or unintended function execution paths. -

(assert_invalid
  (module 
    (func $test
      (i32.const 1)
      (loop (result i32)
        (if (result i32) 
          (i32.const 1) 
          (call_indirect (type $sig1) (i32.const 0)))
        (drop)
        (br 0)
      )
    )
    (type $sig1 (func (result i32)))
    (table funcref (elem (type $sig2)))
    (type $sig2 (func (result f32)))
  )
  "type mismatch"
)