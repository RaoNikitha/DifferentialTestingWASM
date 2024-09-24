;; 4. **Test Description**: Design a module with a `loop` instruction exporting a function that calls an imported function. Ensure the imported function contains a backward branch to the start of its own loop block using `br`, and returns values that need to be validated against the expected state of the calling module.

(assert_invalid
  (module
    (import "env" "external_loop_fn" (func $external_loop_fn (result i32)))
    (func $test_func (result i32)
      (call $external_loop_fn)
      (result i32)
    )
  )
  "missing result type"
)