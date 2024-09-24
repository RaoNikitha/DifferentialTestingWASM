;; 8. **Mixed Loop and Block Targets:**    Create mixed scenarios where `br` instructions target both loops and blocks interchangeably. Evaluate the control flow to ensure no `unreachable` paths are reached due to confusion between forward and backward branching mechanics.

(assert_invalid
  (module (func $mixed-loop-block
    (block (loop (br 1) (br 0)))
  ))
  "type mismatch"
)