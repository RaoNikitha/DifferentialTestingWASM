;; 3. **Type Mismatch in `br_if` Condition**: Define a loop containing a `br_if` instruction where the condition is a float instead of the required integer. This will test the enforcement of type constraints on the condition operand of the `br_if` instruction.

(assert_invalid
  (module (func $type-mismatch-br_if-loop
    (f32.const 1.0) (loop (block (br_if 0))))
  )
  "type mismatch"
)