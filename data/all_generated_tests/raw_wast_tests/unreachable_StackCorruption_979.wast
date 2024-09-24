;; 10. **Test Description:**    Place `unreachable` within a function that is directly called by another function, which has its own stack operations. Tests if the called function's `unreachable` instruction appropriately traps control flow and stack operations.    <br>**Constraint:** Ensure that the calling function’s stack is not affected by the called function's `unreachable` trap.

(assert_invalid
  (module (func $inner
    (unreachable))
  (func $outer
    (call $inner)
    (i32.const 0))
  )
  "unreachable instruction within the called function traps control flow"
)