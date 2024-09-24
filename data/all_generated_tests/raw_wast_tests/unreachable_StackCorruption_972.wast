;; 3. **Test Description:**    A conditional branch where one branch contains `unreachable` and the other contains valid stack operations. Tests if the `unreachable` branch correctly interrupts stack operations.    <br>**Constraint:** Check that only the valid branch manipulates the stack, and the `unreachable` branch does not affect it.

(assert_invalid
  (module (func (result i32)
    (if (i32.const 1)
      (then (unreachable))
      (else (i32.add (i32.const 10) (i32.const 20)))
    )
  ))
  "type mismatch"
)