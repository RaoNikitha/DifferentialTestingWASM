;; 3. **Test 3: Complex If-Block Structures with Conditional Branches**    - A complex set of nested `if` and `block` instructions where `br` instructions are used conditionally to exit to different levels of the enclosing structured control instructions.    - Constraint: Check the validity of label referencing and operand management inside conditional branches.    - Stack Corruption Check: Ensure conditions properly manage the operand stack without leaving invalid data.

(assert_invalid
  (module
    (func $complex-conditional-br (param i32) (result i32)
      (if (result i32)
        (local.get 0)
        (then
          (block (result i32)
            (if (result i32)
              (block (result i32)
                (br_if 0 (i32.const 1))
                (i32.const 2)
              )
              (then
                (br 1)
              )
            )
            (i32.const 3)
          )
        )
      )
    )
  )
  "type mismatch"
)