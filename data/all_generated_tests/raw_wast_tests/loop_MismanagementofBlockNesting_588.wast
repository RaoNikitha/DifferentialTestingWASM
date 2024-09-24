;; Execute a test where a `br_table` inside a loop has indices for both the loop and a nested block. WebAssembly should handle the correct depth jumping internally, but Wizard Engine might misinterpret the indices resulting in jumping past the loop or block depths.

(assert_invalid
  (module
    (func $test
      (loop $labelA
        (block $labelB
          (br_table $labelB $labelA (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)