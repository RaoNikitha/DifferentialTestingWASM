;; 5. Implement a `br` instruction in an `if` construct with multiple else branches, and validate the stack unwinding correctly. Incorrect stack height assumptions in such conditional branches can expose issues in proper operand management leading to stack corruption.

(assert_invalid
  (module (func $br_in_if_with_else_stack_unwind
    (block (result i32)
      (if (result i32)
        (i32.const 1)
        (then 
          (br 0 (i32.const 2))
        )
        (else 
          (i32.const 3)
        )
      )
    )
  ))
  "type mismatch"
)