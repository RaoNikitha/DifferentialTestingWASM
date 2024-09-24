;; 6. **Test for Loop with Type Change Mid-Execution**: Design a loop where an instruction changes the type of an operand midway (e.g., using a type conversion instruction) leading to a type mismatch expected at the end of the loop.

(assert_invalid
  (module
    (func $type-change-mid-execution
      (loop (result i32)
        (i32.const 10)
        (i32.const 20)
        (i32.add)
        (f32.convert_i32_s) ; type changes here from i32 to f32
        (br 0)
      )
    )
  )
  "type mismatch"
)