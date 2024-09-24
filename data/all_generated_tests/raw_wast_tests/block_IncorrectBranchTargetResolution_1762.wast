;; 3. A test combining blocks and loops where a `br_if` instruction within the block conditionally branches to an outer loop's label. This verifies if conditional branches respect the correct nesting depth for label resolution.

(assert_invalid
  (module
    (func $test (result i32)
      (loop $loop_label (result i32)
        (block $block_label (result i32)
          (br_if $loop_label (i32.const 1) (i32.const 1)) (i32.const 0)
        )
        (i32.const 2)
      )
    )
  )
  "type mismatch"
)