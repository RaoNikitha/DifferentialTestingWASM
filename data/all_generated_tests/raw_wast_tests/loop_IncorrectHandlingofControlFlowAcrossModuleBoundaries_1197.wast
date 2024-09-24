;; Test 8: Design an exported function with a deep loop structure where each iteration calls an imported function that executes another loop. Analyze how both implementations handle the nested call stack and label management across these boundaries.

(assert_invalid
  (module
    (import "env" "external_loop" (func $external_loop))
    (func (export "deep_nested_loop")
      (i32.const 5)
      (loop (result i32)
        (block
          (call $external_loop)
          (br_if 1 (i32.const 1))
          (loop (result i32)
            (call $external_loop)
            (br 1)
          )
        )
      )
    )
  )
  "type mismatch"
)