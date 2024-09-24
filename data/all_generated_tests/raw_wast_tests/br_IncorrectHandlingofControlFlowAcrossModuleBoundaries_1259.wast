;; 10. **Test Description:**    Develop an imported function that conditionally executes a `br` instruction based on operand stack values. The function is called within a `block` in another module. Check if the conditional branch correctly handles operand values and control flow transitions back to the calling module.

(assert_invalid
  (module
    (func $imported-func (param i32) (result i32)
      (local.get 0)
      (if (result i32)
        (then (br 0))
        (else (i32.const 0))
      )
    )
    (import "env" "importedFunc" (func $imported-func (param i32) (result i32)))
    (func (export "testFunc")
      (block (result i32)
        (i32.const 42)
        (call $imported-func)
        (br 0)
      )
    )
  )
  "type mismatch"
)