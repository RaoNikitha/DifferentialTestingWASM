;; 3. **Conditional Block Trap Test:**    - Place an `unreachable` instruction inside the `then` branch of an `if-else` construct within a loop. Follow it with a `br_if` instruction that should exit the loop. Ensure that encountering the `unreachable` instruction stops execution and does not affect the `br_if` resolution.

(assert_invalid
  (module
    (func (loop
      (if (i32.const 1)
        (then
          (unreachable)
        )
        (else
          (br_if 1)
        )
      )
    ))
  "type mismatch"
))