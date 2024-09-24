;; 4. **Test for Nested Loops with Multiple `br` Instructions**:    - Form nested loops, each with its own set of `br` instructions targeting different levels of loops. Validate the stack state at the innermost and outermost levels.    - **Constraint**: Handling of nested control flow and stack unwinding for each loop context.    - **Relation to Stack Corruption**: Incorrect unwinding in nested contexts can corrupt stack state across the loops.

(assert_invalid
  (module
    (func $nested-loops-with-br
      (i32.const 0)
      (block (loop (result i32)
        (block (loop (result i32)
          (br 1)
          (br 2)
          (i32.const 1)
        ))
        (i32.add)
      ))
    )
  )
  "type mismatch"
)