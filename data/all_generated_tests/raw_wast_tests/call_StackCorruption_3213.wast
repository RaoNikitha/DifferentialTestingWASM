;; 2. Create a scenario where a `call` instruction uses an out-of-bounds function index, verifying that the stack correctly traps and does not continue with corrupted data.

(assert_invalid
  (module
    (func $test-out-of-bounds-call (call 100))
  )
  "unknown function"
)