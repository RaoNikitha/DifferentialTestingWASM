;; Construct a `block` with a series of nested function calls to both imported and exported functions from different modules. Ensure that stack operations during these cross-module calls do not corrupt the stack or deviate from the expected control flow path defined by the `block`.

(assert_invalid
  (module
    (import "mod" "func" (func $imp))
    (func $export (export "exportedFunc")
      (block (result i32)
        (call $imp)
        (br 0 (i32.const 1))
      )
    )
  )
  "type mismatch"
)