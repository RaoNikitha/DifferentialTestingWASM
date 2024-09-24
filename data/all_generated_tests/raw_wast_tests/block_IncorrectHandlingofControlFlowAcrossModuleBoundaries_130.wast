;; 1. Create a WASM module with a `block` that includes a `call` to an imported function. Ensure the `call` is nested within multiple block levels and followed by several nested `end` instructions. Verify that control flow correctly resumes after the `end` of all blocks.

(assert_invalid
  (module
    (import "env" "imported_func" (func $imported_func (result i32)))
    (func $test (result i32)
      (block (result i32)
        (block (result i32)
          (call $imported_func)
          (block (result i32)
            (block (result i32)
              (end)
            )
            (end)
          )
          (end)
        )
        (end)
      )
    )
  )
  "type mismatch"
)