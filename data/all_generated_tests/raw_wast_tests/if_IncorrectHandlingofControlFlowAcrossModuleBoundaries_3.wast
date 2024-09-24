;; 4. **Test Description:**    Structure an `if` instruction with deeply nested calls to imported functions in the `then` block and exported functions in the `else` block. Check for inconsistencies in control flow and stack state transitions, particularly examining the boundary across nested calls.

(assert_invalid
  (module
    (import "env" "ext_func" (func $ext_func (param i32) (result i32)))
    (export "exp_func" (func $exp_func))
    (func $exp_func (param i32) (result i32)
      (if (result i32)
        (i32.const 1)
        (then
          (call $ext_func (call $ext_func (i32.const 3))))
        (else
          (call $exp_func (i32.const 2)))
      )
    )
  )
  "type mismatch"
)