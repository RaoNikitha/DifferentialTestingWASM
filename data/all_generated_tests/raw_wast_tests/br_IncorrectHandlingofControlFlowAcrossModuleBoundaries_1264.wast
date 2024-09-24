;; 5. **Function with Multiple Imports and Br:**    Implement a test where a function in the main WASM module performs calls to multiple imported functions, each containing different structured control instructions with `br` to various labels. This ensures proper stack and control flow maintenance.

(assert_invalid
  (module
    (import "env" "func1" (func $func1 (param i32) (result i32)))
    (import "env" "func2" (func $func2 (param i32) (result i32)))
    (func $main (param $p i32) (result i32)
      (block $block1 (result i32)
        (block $block2 (result i32)
          (call $func1 (local.get $p))
          (br 0)
        )
        (call $func2 (local.get $p))
        (br 0)
      )
      (i32.const 0)
    )
  )
  "type mismatch"
)