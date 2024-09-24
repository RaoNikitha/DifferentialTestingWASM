;; 1. **Test Invalid Block Type Conversion**:    - Create a `loop` instruction with an invalid block type that does not conform to a valid function type `[t*1] -> [t*2]`.     - **Constraint**: Block type must be a valid function type.    - **CFG Impact**: Incorrect conversion can cause the loop block to be misunderstood, leading to unreachable code or incorrect loop structures.

(assert_invalid
  (module (func
    (loop (param i64 i32) (drop))
  ))
  "type mismatch"
)