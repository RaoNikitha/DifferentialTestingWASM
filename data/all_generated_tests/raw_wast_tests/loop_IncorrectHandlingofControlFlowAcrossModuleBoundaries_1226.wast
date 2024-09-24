;; 7. **Test Description**: Develop a module that exports a function containing a `loop` instruction, which calls an imported function with branches utilizing `br` from within multiple loop blocks. This test addresses the proper handling of control flow and stack unwinding for backward branches when transitioning across module boundaries.

(assert_invalid
  (module
    (import "env" "ext_func" (func $ext_func (result i32)))
    (func $test
      (loop (result i32)
        (call $ext_func)
        (br 0)
      )
      (i32.const 1)
    )
  )
  "type mismatch"
)