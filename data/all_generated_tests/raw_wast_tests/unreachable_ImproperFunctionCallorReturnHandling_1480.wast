;; 1. Test a function that calls another function which contains an `unreachable` instruction right at the start. Verify if the caller function traps immediately upon calling this function in both implementations.

(assert_invalid
  (module
    (func $callee
      unreachable
    )
    (func $caller
      call $callee
    )
  )
  "function body must be valid"
)