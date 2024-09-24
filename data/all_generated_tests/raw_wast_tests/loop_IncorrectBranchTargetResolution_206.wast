;; 7. **Branch with Multiple Operand Types**    - Test a loop where a `br_if` instruction within the loop branches based on multiple operand types. This checks if mixed operand types correctly return the control flow to the loop.

(assert_invalid
  (module
    (func $branch-multiple-operands
      (block
        (loop (result i32)
          (br_if 0 (i32.const 1) (f32.const 0.0))
        )
      )
    )
  )
  "type mismatch"
)