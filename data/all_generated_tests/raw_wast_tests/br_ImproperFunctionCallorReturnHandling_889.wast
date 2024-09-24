;; 10. Different functions with a `loop` invoking a `call`, followed by a `br` instruction targeting the loop head, testing for correct management of the call's return value between loop iterations, where WebAssembly mishandles return values differently from wizard_engine.

(assert_invalid
  (module
    (func $differential_test
      (loop (result i32)
        (call $some_function)
        (br 0)
      )
    )
    (func $some_function (result i32)
      (i32.const 42)
    )
  )
  "type mismatch"
)