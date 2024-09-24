;; 8. Design a function employing stack operations, ensuring that an invalid use of the stack conditionally leads to an `unreachable` instruction. Assess if the trap is triggered due to stack mismanagement.

(assert_invalid
  (module (func 
    (select (i32.const 1) (i32.const 2) (unreachable))
  ))
  "type mismatch"
)