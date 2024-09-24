;; 9. **Test Description:**    - Implement a sequence of blocks where multiple `br` instructions target different levels and blocks based on dynamic conditions. Validate that each branch correctly manages the stack unwinding and operand stack to detect stack underflows or overflows due to label misinterpretation.

(assert_invalid
  (module
    (func $nested-br (result i32)
      (block (result i32)
        (block (result i32)
          (block (result i32)
            (i32.const 1)
            (br 2)
            (i32.const 0)
          )
          (br 1)
          (i32.const 0)
        )
        (br 0)
        (i32.const 0)
      )
    )
  )
  "type mismatch"
)