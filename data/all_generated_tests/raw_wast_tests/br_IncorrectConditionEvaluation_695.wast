;; 6. **Test Description:**    A control flow with a `block` that contains a sequence of `if-else` constructs with `br_if` instructions, using both integer and boolean conditions. Test should verify correct conditional branching and label referencing within the block.    - **Constraint:** Validates condition evaluation and correct operand handling within complex block structures.

(assert_invalid
  (module
    (func $complex-conditionals
      (block (result i32)
        (i32.const 1)
        (if (result i32)
          (then
            (i32.const 42)
            (br_if 0 (i32.const 0))
          )
          (else
            (i32.const 24)
          )
        )
        (i32.const 5)
      )
    )
  )
  "type mismatch"
)