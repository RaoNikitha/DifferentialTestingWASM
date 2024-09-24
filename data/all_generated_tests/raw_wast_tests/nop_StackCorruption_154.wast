;; Test 5: Create a function that uses `nop` immediately before and after control flow instructions like `br`, `br_if`, and `br_table`, then verify that the stack remains consistent without corruption.

(assert_malformed
  (module
    (func $control-flow-nop
      (block 
        nop
        br 0
        nop
      )
    )
  )
  "unexpected instruction 'nop'"
)