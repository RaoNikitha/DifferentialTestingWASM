;; Within a block, call a chain of imported functions from different modules, each returning a different type. Verify that each call properly updates the operand stack and transitions correctly, ultimately ensuring the block's result type matches its annotation.

(assert_invalid
  (module
    (import "mod1" "func1" (func $func1 (result i32)))
    (import "mod2" "func2" (func $func2 (result f32)))
    (func $type-imported-functions (result i32)
      (block (result i32)
        (call $func1)
        (call $func2)
      )
    )
  )
  "type mismatch"
)