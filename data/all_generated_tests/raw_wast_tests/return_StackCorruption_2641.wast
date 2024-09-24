;; 10. **Complex Control Flow with Early Return**:     - Create a function with a complex control flow including loops and conditional blocks with early return instructions. Verify both implementations handle stack unwinding correctly when returning from various points within the function to avoid stack corruption.

(assert_invalid
  (module
    (func $complex-control-flow-early-return (result i32)
      (i32.const 5)
      (block
        (loop
          (br_if 1 (i32.eqz (i32.const 0)))
          (if (i32.eq (i32.const 1) (i32.const 1))
            (then
              (return (i32.add (i32.const 2) (i32.const 3)))
            )
          )
        )
      )
    )
  )
  "type mismatch"
)