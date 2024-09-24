;; 6. **Test Description**: Construct a test case that examines a branch in an if-else block, where multiple `br_if` instructions require exact stacking and popping of operands. Purposefully set up operands so mismanagement is likely if constraints aren't adhered to.   - **Constraint Being Checked**: Correct stack management through conditional branches in nested if-else structures.   - **Stack Corruption Aspect**: Faulty execution can switch expected operand values and leave corrupted data on the stack.

(assert_invalid
  (module
    (func $stack-mismanagement
      (block
        (i32.const 0)
        (i32.const 1) (br_if 0 (i32.const 1))
        (i32.const 2)
        (if (result i32)
          (then (br_if 0 (i32.const 1)))
          (else (br_if 0 (i32.const 0)))
        )
        (i32.add) (drop)
      )
    )
  )
  "type mismatch"
)