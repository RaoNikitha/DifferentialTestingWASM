;; 8. **Test Description:**    Have an `if` statement where the `then` block includes a tail call to an exported function that returns to another call site within the parent module. Validate proper handling of control flow, especially the transitions and returns across the module boundary.

(assert_invalid
  (module
    (func $exported (result i32)
      (i32.const 42)
    )
    (export "exported_func" (func $exported))
    (func
      (if (result i32) (i32.const 1)
        (then (call $exported))
      )
    )
  )
  "type mismatch"
)