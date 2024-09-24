;; 10. Test Description: **Deep Loop Resumptions with Stack Operand Testing**     - Using deeply nested loops where the `br` targets the start of different loops, verify correct operand stack management when control resumption happens at loop starts.     - Constraint: Validates correctness of operand stack unwinding and consistency at loop resumptions in deep nestings.

(assert_invalid
  (module (func $deep-loop-resumptions
    (block
      (loop $l1
        (loop $l2
          (loop $l3
            (br $l1)
          )
          (i32.const 0)
        )
        (i32.const 0)
      )
    )
  ))
  "label index out of bounds"
)