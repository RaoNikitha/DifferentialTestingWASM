;; 4. **Function End with Unreachable After Valid Instr:**    - Context: At the end of a function, place an `unreachable` instruction after a valid return-producing expression sequence.    - Constraint: Ensure CFG consistency by checking that any function exit path through unreachable is properly captured as a trap.    - Expected Behavior: A consistent trap should be produced without reaching the actual function return in both implementations.

(assert_invalid
  (module (func $end-with-unreachable
    (i32.const 1)
    (unreachable)
  ))
  "unreachable executed"
)