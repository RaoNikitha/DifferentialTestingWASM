;; - **Test 1**: A `block` instruction with a `br_table` that has an index out of the specified range. Test if `wizard_engine` properly adjusts `ctl_stack` while WebAssembly's nested context correctly identifies out-of-range index.

(assert_invalid
  (module
    (func $test
      (block
        (i32.const 0)
        (br_table 0 1)
      )
    )
  )
  "invalid branch index"
)