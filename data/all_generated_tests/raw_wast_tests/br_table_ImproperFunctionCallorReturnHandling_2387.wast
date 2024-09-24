;; 7. Implement a `br_table` with operand types mismatching across labels that include `call` instructions. This test should identify inconsistencies or traps due to improper call handling based on the operand stack configuration.

(assert_invalid
  (module (func $mismatching-operands-with-call
    (block (result i32)
      (call $dummy)
      (br_table 0 1 2 (i64.const 0))
    )
    (func $dummy (result i64)
      (i64.const 42)
    )
  ))
  "type mismatch"
)