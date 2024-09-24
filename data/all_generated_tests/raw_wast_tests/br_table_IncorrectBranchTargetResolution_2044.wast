;; 4. **Exhaustive Operand Stack Check:**    Use a stack configuration with additional irrelevant operands to test operand stack handling.    - **Test Constraint:** Ensure correct unwinding and handling of operands when `br_table` targets a branch.    - **Expected Differential:** WebAssembly should handle the operand stack correctly, wizard_engine might skip or mishandle excess operands.

(assert_invalid
  (module
    (func (param i32 i32 i32) (result i32)
      (block
        (loop (result i32)
          (block (result i32)
            (local.get 1)
            (local.get 2)
            (br_table 0 1 (i32.const 2) (local.get 0))
          )
        )
      )
    )
  )
  "type mismatch"
)