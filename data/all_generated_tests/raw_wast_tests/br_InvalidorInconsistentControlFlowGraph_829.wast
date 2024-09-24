;; 10. **Test for Polymorphic Operand Stack Unwinding:**     - **Description**: Multiple `br` instructions in nested blocks testing unwinding and correctness of operand stack polymorphism.     - **Constraint Checked**: Ensures operand stack unwinds correctly for nested blocks.     - **Relation to CFG**: Verifies consistent operand stack unwinding in complex control flow situations within CFG.

(assert_invalid
  (module
    (func $test_polymorphic_stack_unwind
      (block
        (i32.const 0)
        (block
          (i32.const 1)
          (block
            (br 2) 
            (i32.const 2)
          )
          (i32.const 3)
        )
        (i32.const 4)
      )
      (i32.const 5)
    )
  )
  "type mismatch"
)