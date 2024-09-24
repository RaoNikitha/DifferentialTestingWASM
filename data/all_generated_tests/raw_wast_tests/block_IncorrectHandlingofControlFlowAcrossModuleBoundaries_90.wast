;; 1. **Test imported function call within a block**:    - Create a block that calls an imported function and checks whether the stack state is preserved and correctly managed.    - Validate if transitioning back from the called module to the calling module results in correct execution flow and stack integrity.

(assert_invalid
  (module 
    (import "env" "external_func" (func $external_func (param i32) (result i32)))
    (func $test
      (block (result i32)
        (call $external_func (i32.const 42))
      )
      (i32.add (i32.const 1))
    )
  )
  "type mismatch"
)