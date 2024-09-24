;; 8. **Test Description:**    Implement a module that defines nested `loop` blocks and calls an imported function including a `br` targeting the outer loop in the caller module. The test should inspect correct backward jumps and accurate operand stack management.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func (param i32)))
    (func $nested-loops (result i32)
      (loop (loop (i32.const 1)
                  (br 1)
                  (call $external_func (i32.const 0))
            )
            (nop)
      )
    )
  )
  "type mismatch"
)