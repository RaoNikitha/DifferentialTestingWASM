;; 3. Create a function where an `unreachable` instruction is placed within an `if` branch expected to return `i32`, but fill the branch with `i64` operations to induce a type error. Validate if the engine traps properly.

(assert_invalid
  (module (func $different_type_in_if (result i32)
    (if (result i32) (i32.const 1)
      (then (unreachable) (i64.const 1))
    )
  ))
  "type mismatch"
)