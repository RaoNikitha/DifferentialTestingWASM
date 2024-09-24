;; 4. **Test Description 4**:    Generate a complex nested loop scenario where inner loops involve function calls and returns. Verify that the outer loop correctly maintains stack integrity and continues correct execution flow.

(assert_invalid
  (module
    (func $nestedLoops (result i32)
      (loop (result i32)
        (i32.const 0)
        (loop (result i32)
          (call 0)
        )
        (br 1)
      )
    )
    (func (result i32) (i32.const 42))
  )
  "type mismatch"
)