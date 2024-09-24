;; 6. **Test Description:**    - Design a control structure with an `if` statement nested within a `block`. Include a `br` instruction from within the `if` block targeting the outer `block`.    - **Constraint:** Confirm that the branch correctly exits the outer `block` and resumes after its end.    - **CFG Check:** Validates the correct processing of branches out of nested `if` statements, maintaining CFG integrity.

(assert_invalid
  (module
    (func $nested-if-with-br (result i32)
      (block $outer (result i32)
        (i32.const 1)
        (if (result i32)
          (then
            (br $outer)
          )
          (else
            (i32.const 2)
          )
        ) 
        (i32.const 3)
      )
    )
  )
  "type mismatch"
)