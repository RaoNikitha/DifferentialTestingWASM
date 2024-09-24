;; 4. Test for stack corruption by crafting an `if` instruction that includes `unreachable` within both `then` and `else` blocks. This will test how each implementation handles sudden control flow changes and stack unwinding.

(assert_invalid
  (module (func $stack-corruption-test
    (if (result i32)
      (then (unreachable))
      (else (unreachable)) 
    )
  ))
  "type mismatch"
)