;; 3. **Nested `br_table` with Cross-Module Indirections:**    - Design a WASM module where a nested block uses `br_table` to branch to labels that include calls to a function from an imported module.    - **Constraint Checked:** Verification that nested `br_table` maintains proper control flow and correct block unwinding across module calls.    - **Reasoning:** Investigates if the `br_table` manages the operand stack correctly and adheres to control flow across modules.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (result i32)))
    (func (result i32)
      (block (result i32)
        (block (result i32)
          (br_table 0 1 (i32.const 0))
        )
      (call $external_func)
      )
    )
  )
  "type mismatch"
)