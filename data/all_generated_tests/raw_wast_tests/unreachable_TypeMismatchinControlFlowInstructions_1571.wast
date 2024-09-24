;; 2. **Test Description:** Construct a `loop` containing an `unreachable` followed by an integer constant and an `add` instruction.    **Constraint:** The loop should expect integers on the stack, but the trap interrupts this flow.    **Reasoning:** Tests how `unreachable` within loops affects type consistency expected by subsequent instructions.

(assert_invalid
  (module (func $loop-unreachable-type-mismatch
    (loop (unreachable) (i32.const 1) (i32.add))
  ))
  "type mismatch"
)