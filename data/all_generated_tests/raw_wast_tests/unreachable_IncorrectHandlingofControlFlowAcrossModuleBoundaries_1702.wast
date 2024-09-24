;; Test 3: Nest the unreachable instruction within a block that calls an imported function. Ensure proper trap behavior in both WebAssembly and wizard_engine when exiting the block.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func
      (block
        (unreachable)
        (call $external_func)
      )
    )
  )
  "type mismatch"
)