;; 10. **Test Description:** Write a function using `br_if` within a `loop` that performs multiple sequential imports and exports of functions modifying the stack.    **Constraint Checked:** Sequential control and stack operations within nested loops and interactions with imports/exports.    **Relation:** Validates consistent and sequential management of stack operations across imported/exported functions within loops.

(assert_invalid
  (module
    (import "env" "func" (func $imported (param i32) (result i32)))
    (func $test
      (loop $outer (result i32)
        (call $imported (i32.const 10))
        (loop $inner (result i32)
          (call $imported (i32.const 20))
          (br_if 1 (i32.const 1))
        )
        (br_if 0 (i32.const 0))
      )
    )
    (export "exported" (func $test))
  )
  "type mismatch"
)