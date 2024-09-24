;; 4. **Dynamic Operand Stack Adjustment in Loops:**    Implement a `br_table` in a loop that dynamically adjusts the operand stack. This test will check if the runtime correctly manages operand types when repeatedly branching back to the loop, ensuring the CFG does not miss invalid operand configuration.

(assert_invalid
  (module
    (func $dynamic-stack-loop (param i32) (result i32)
      (local i32)
      (block $outer (result i32)
        (loop $inner (result i32)
          (local.set 0 (i32.add (local.get 0) (i32.const 1)))
          (br_table $inner $outer (local.get 0))
        )
      )
    )
  )
  "type mismatch"
)