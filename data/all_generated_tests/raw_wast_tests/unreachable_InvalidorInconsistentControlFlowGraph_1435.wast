;; 6. Place `unreachable` at the end of a function and verify if the function terminates correctly without executing any subsequent implicit return operations or other possible instructions.    - **Constraint:** `unreachable` should guarantee an immediate trap, even at the function's end.    - **CFG Check:** Ensure function termination is correctly managed in the presence of `unreachable`.

(assert_invalid
  (module (func $unreachable-at-end (result i32)
    (unreachable) (i32.const 1)
  ))
  "type mismatch"
)