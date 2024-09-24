;; - **Test 9**: Include a `block` instruction with a deeply nested `br_table` having an out-of-bounds index, potentially resulting in segmentation faults or undefined behavior. Compare how `wizard_engine` and WebAssembly prevent or manage such critical errors.

(assert_invalid
  (module 
    (func $test
      (block
        (block
          (br_table 0 1 2 (i32.const 3))
        )
      )
    )
  )
  "unknown label"
)