;; A test where an `if` instruction within the main module calls a function from another module inside the `then` block, and this called function makes deep nested calls back to functions in the main module, testing stack alignment across boundaries.

(assert_invalid
  (module
    (import "env" "ext_func" (func $ext_func (result i32)))
    (func $main_func (result i32)
      (if (result i32) (i32.const 1)
        (then (call $ext_func))
        (else (i32.const 0))
      )
    )
  )
  "type mismatch"
)