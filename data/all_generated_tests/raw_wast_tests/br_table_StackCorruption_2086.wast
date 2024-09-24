;; 6. **Test6: Mismatched Control Flow Exit Types**    - **Description:** Design a `br_table` that attempts to exit from blocks with mismatched type sequences, thus breaching control flow constraints.    - **Stack Corruption Check:** Verify if improper exits lead to stack inconsistencies or improper operand retention on the stack.

(assert_invalid
  (module (func $mismatched-control-flow
    (block (result i32) (block (result i32)
      (br_table 0 1 (i32.const 0)) (i64.const 1))
    )
  ))
  "type mismatch"
)