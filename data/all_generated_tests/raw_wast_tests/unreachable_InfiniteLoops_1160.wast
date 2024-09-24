;; 1. **Test Description:**     - Create a loop containing an `unreachable` instruction followed by a `br_if` conditional branch that should always exit the loop.    - **Constraint:** Check if the `unreachable` correctly causes a trap when hit before the condition is evaluated.    - **Relation to Infinite Loops:** If the `br_if` incorrectly evaluates due to missed tracking of positions, it may never exit, causing an infinite loop.     - **Expected Behavior:** Trap should occur due to `unreachable`.

(assert_invalid
  (module (func $test-unreachable-in-loop (loop (unreachable) (br_if 0 (i32.const 1))))
  )
  "unreachable executed"
)