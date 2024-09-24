;; 7. **Test Description:**    - A `loop` contains a `call` followed by an `unreachable` instruction. The loop should trap on the first iteration due to `unreachable`, ignoring subsequent calls and loops.    - **Constraint:** Ensures loop control is correctly interrupted.    - **Improper Function Call or Return Handling:** Confirms correct handling of function calls within loop interrupted by `unreachable`.

(assert_invalid
  (module
    (func $type-loop-call-unreachable
      (loop
        (call $dummy_function)
        unreachable
      )
    )
    (func $dummy_function (result i32)
      (i32.const 0)
    )
  )
  "type mismatch"
)