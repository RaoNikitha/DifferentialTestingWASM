;; 2. Design a sequence where a `call_indirect` is placed right after an `unreachable` instruction within a loop. The test checks if the trap prevents the indirect call's function lookup and execution.

(assert_invalid
  (module (func $type-loop-unreachable-in-call-indirect
    (loop
      (unreachable)
      (call_indirect (type (func)) (i32.const 0))
    )
  ))
  "type mismatch"
)