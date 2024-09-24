;; 2. **Test Description:**    - Create a module that exports a function with a nested `loop` and `br` instruction targeting the loop start.    - Import and call this function from another module, and check if the control flow correctly returns to the loop start within the context of the original module.    - **Constraint:** Test the correct backward branch handling and stack restoration between module boundaries.

(assert_invalid
  (module
    (func $loop_test (export "loop_test")
      (loop $loop
        nop
        (br $loop)
      )
    )
    (func (import "env" "call_loop_test"))
    (func (call $loop_test))
  )
  "unknown import"
)