;; Implement a function that calls itself recursively, designed to exceed the call stack limit. Test if both WebAssembly and wizard_engine properly detect and handle stack overflow errors.

(assert_invalid
  (module
    (func $recursive (result i32)
      (call $recursive)
      (i32.const 0)
    )
    (func (export "start") (call $recursive))
  )
  "stack overflow"
)