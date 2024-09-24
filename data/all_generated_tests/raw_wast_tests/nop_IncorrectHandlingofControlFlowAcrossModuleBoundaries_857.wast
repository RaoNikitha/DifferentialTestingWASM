;; 8. **Test Description**: Place `nop` instructions in a sequence leading up to a `return` from a function that calls an imported module function, ensuring the control flow resumes to the caller correctly.    - **Constraint**: Ensure `nop` does not affect return and stack consistency.    - **Relates to**: Ensures return control remains intact across module boundaries with `nop`.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (export "test")
      (nop) (nop) (nop)
      call $external_func
      (return)
    )
  )
  "type mismatch"
)