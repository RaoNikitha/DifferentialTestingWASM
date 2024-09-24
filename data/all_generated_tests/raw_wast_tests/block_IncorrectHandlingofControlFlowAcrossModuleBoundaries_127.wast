;; 8. Use a `block` in the main module that calls an imported function with a `br_table` inside. Ensure stack heights are correctly unwound for multiple branch targets within the block.

(assert_invalid
  (module
    (import "env" "external_func" (func $external_func))
    (func
      (block
        (br_table 0 1 2 (call $external_func))
      )
    )
  )
  "type mismatch"
)