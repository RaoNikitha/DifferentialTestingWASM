;; 8. **`nop` in Function with Multiple Return Points**:    - Insert `nop` at various points between different possible return statements in a function. Validate that `nop` does not alter the CFG relating to diverse return paths.    - Constraint: Checks multiple return point handling within CFG when `nop` is introduced.

(assert_invalid
  (module (func (param i32) (result i32)
    (if (i32.eqz (local.get 0))
      (then (nop) (return (i32.const 0)))
      (else (nop) (return (i32.const 1)))
    )
  ))
  "type mismatch"
)