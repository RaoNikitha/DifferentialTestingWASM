;; 10. **Dangling Type Index in Conditional Branch**:    - Use a `br_if` to conditionally call `call_indirect` with an invalid `typeidx`.    - Ensure the test evaluates whether the condition leads to a failed execution in OCaml and potentially improper checks in Java.

(assert_invalid
  (module
    (type (func (param i32)))
    (table 1 funcref)
    (func $conditional-dangling-type
      (if (i32.const 1)
        (then (call_indirect (type 0xffffffff) (i32.const 0)))
      )
    )
  )
  "type index out of bounds"
)