;; 9. **Test Description:** Write a module comprising nested control structures with varied operand stack manipulations followed by a `br_table`. Control transfers should correctly address intended blocks, checking for inadvertent termination due to a mismatch in expected control depths.

(assert_invalid
  (module
    (func
      (block
        (i32.const 0)
        (block
          (block (br_table 2 1 0 (i32.const 5)))
        )
      )
    )
  )
  "unknown label"
)