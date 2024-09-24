;; 2. Place a `nop` at the beginning of the function and verify if the execution reaches subsequent instructions without alteration.    **Constraint:** Validate that no control flow constraints are imposed by the initial `nop`.

(assert_invalid
  (module
    (func (nop) (i32.const 1))
  )
  "unexpected instruction"
)