;; 2. Test a function with a `loop` containing an `unreachable` instruction, followed by an `i32.add` that incorrectly assumes a valid `i32` value on the stack, causing a type mismatch upon execution.

(assert_invalid
  (module (func $type-loop-unreachable-add (result i32)
    (loop (unreachable) (i32.add))
  ))
  "type mismatch"
)