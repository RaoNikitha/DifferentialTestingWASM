;; 7. **Test Description:**     Use a function where `unreachable` is placed after a valid instruction sequence involving multiple calls. Confirm no further instruction or call executions after the trap.    **Constraint Checked:** Accurate handling of traps post-multiple calls.    **Relation to Improper Call/Return Handling:** Ensures a stop in execution after `unreachable` regardless of previous successful calls.

(assert_invalid
  (module (func $type-call-after-unreachable
    (call $some_func) (unreachable)
    (call $another_func)
  ))
  "type mismatch"
)