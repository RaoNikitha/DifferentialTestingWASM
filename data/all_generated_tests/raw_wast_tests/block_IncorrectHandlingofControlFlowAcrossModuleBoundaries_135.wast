;; Implement a nested `block` and `loop` combination, with multiple `end` instructions, where the inner `block` calls an imported function. Validate that the `loop` continuation and control flow handle nested blocks and imported function calls properly, preserving the stack state.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func (result i32)
      (block (result i32)
        (i32.const 10)
        (block (result i32)
          (call $external_func)
          (br 1)
        )
        (i32.const 20)
        (br 0)
        (i32.const 30)
      )
    )
  )
  "type mismatch"
)