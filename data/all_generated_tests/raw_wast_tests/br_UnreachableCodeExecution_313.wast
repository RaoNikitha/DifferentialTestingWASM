;; 4. Create an inner `block` within an outer `block`. Use a `br` to an `if` label inside the inner block but provide incorrect operand types, thus leading to execution of an `unreachable` instruction.

(assert_invalid
  (module (func $incorrect-br-operand-types
    (block (block
      (if (then (br 1 (i32.const 1.1))))
    ))
  ))
  "type mismatch"
)