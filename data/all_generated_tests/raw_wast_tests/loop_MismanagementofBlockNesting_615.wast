;; 6. **Unwind Stack on Br with Nested Loops**: Design nested loops where a `br` instruction performs a jump back to an outer loop, necessitating stack unwinding. This test will check if each implementation properly manages the operand stack’s height and consistency upon looping back, revealing any nesting mismanagement.

(assert_invalid
  (module
    (func $unwind_stack_on_br_with_nested_loops
      (block
        (loop $outer (result i32)
          (i32.const 0)
          (loop $inner (result i32) 
            (i32.const 1)
            (br $outer)
          )
        )
      )
    )
  )
  "type mismatch"
)