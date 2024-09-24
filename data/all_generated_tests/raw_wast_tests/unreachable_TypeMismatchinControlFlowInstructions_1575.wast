;; 6. **Test Description:** Write a test where `unreachable` is in a `block` that has a return type different from the instructions following it, like returning an `i32` when the instructions would produce `i64`.    **Constraint:** The type assumption violation should be caught, as `unreachable` interrupts the flow.    **Reasoning:** Validates if return type consistency of a block with `unreachable` affects the subsequent context.

(assert_invalid
  (module
    (func $type-block-unreachable-mismatch (result i32)
      (block (result i32)
        unreachable
      )
      i64.const 0
      i64.extend_i32_u
    )
  )
  "type mismatch"
)