;; 3. **Test Description:**    - Use `unreachable` within a `loop` that contains another nested `loop` with a `br_if`, ensuring the outer loop condition remains true. This should stop execution as soon as the `unreachable` is hit.    - Constraint: Tests nested loop handling in the presence of the `unreachable` instruction.    - Infinite Loop Relation: Ensures the trap from `unreachable` prevents both inner and outer loops from running indefinitely.

(assert_invalid
  (module (func $nested-loop-unreachable
    (block (loop (loop (br_if 1 (i32.const 1)) (unreachable))))
  ))
  "type mismatch"
)