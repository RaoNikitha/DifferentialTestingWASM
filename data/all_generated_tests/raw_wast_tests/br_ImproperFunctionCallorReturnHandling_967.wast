;; 8. **Call within Unreachable Code Path:**    Place a function `call` in an unreachable code path (e.g., after an `unreachable` instruction), followed by a `br`. Determine if the implementation correctly handles the unreachable segment without executing the erroneous call.

(assert_invalid
  (module (func $call-in-unreachable-br
    unreachable
    call 0
    br 0
  ))
  "unreachable code"
)