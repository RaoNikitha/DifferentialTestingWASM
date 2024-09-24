;; 2. **Test Description:**    - Create a nested block within an imported function and include a `br_table` that branches both within the block and to the default label outside the block. Ensure the control flow returns correctly to the calling module.    - **Constraint:** Checks that branches out of nested blocks in an imported context manage the stack correctly.    - **Control Flow Boundary Check:** Confirms the correct unwinding and re-setup of the stack when exiting nested blocks across imported functions.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (result i32)
      (block (result i32)
        (call $external_func)
        (i32.const 0)
        (block 
          (br_table 1 0 (i32.const 1))
          (i32.const 2)
        )
        (i32.eqz)
      )
    )
  )
  "type mismatch"
)