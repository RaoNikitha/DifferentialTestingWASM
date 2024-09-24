;; 3. Develop a test where an `if` instruction lacks a proper `blocktype` declaration, implying `[] -> []`, but the `then` branch tries to push an `i32` onto the stack. This checks if the validator catches the type excess.

(assert_invalid
  (module (func $type-lacking-blocktype-declaration
    (i32.const 1)
    (if (i32.const 1)
      (then (i32.const 1))
    )
  ))
  "type mismatch"
)