;; 7. **Test Complex Control Flow with Nested Blocks and Mixed Br:**    - **Description:** Build complex nested structures mingled with `block`, `loop`, and `if`, with mixed `br` instructions targeting different levels.    - **Reasoning:** Tests overall branch behavior and stack management in sophisticated structures.    - **Constraint:** Ensure correct label interpretation and operand stack management across mixed control flows.    - **Relation to Stack Corruption:** Complex mixed control flows raise the risk of stack corruption due to intricate interactions between stack unwinding and control transfers.

(assert_invalid
  (module
    (func $test-complex-nested-br
      (block (result i32)
        (i32.const 42)
        (block (result i32)
          (loop (result i32)
            (if (i32.eqz (i32.const 0))
              (then
                (br 2) 
              )
              (else
                (block (result i32)
                  (br 1)
                )
              )
            )
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)