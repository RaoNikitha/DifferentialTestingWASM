;; 10. **Test Description:**     - Design a complex module with multiple nested `block` and `loop` structures, where `br` instructions within `block` attempt to manipulate the operand stack with mismatched types like providing an `i32` where an `f32` is expected.     - **Constraint Check:** This test validates comprehensive type enforcement across deeply nested control flows, ensuring branches maintain exact type compliance.     - **Differential Behavior:** While WebAssembly should enforce strict type checks and prevent type mismatches, Wizard Engine’s detailed validation might overlook mismatched types in complex nesting scenarios.

(assert_invalid
  (module
    (func (param i32) (result f32)
      (block (result f32)
        (loop (result f32)
          (block (result f32)
            (br 1 (i32.const 0))
          )
        )
      )
    )
  )
  "type mismatch"
)