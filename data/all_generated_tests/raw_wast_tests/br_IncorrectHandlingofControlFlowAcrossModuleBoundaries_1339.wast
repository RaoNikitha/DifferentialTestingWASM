;; 10. **Test Description 10:**     - **Focus:** Exported function calls within nested loop structures.     - **Constraint:** Ensure that calling exported functions within nested loops preserves correct operand stack and control flow.     - **Incorrect Handling:** Failing to correctly handle exported function calls leading to stack under/overflows within loops.  Each test is designed to identify potential bugs where the different implementations handle the `br` instruction incorrectly, particularly when transitioning control flow between module boundaries.

(assert_invalid
  (module
    (func $exported (export "exported") (param i32) (result i32) (local.get 0))
    (func
      (loop (result i32)
        (block (result i32)
          (call $exported (i32.const 0))
          (br 1)
        )
      )
    )
  )
  "type mismatch"
)