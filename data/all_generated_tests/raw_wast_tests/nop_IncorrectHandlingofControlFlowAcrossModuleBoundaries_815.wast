;; 6. **Test Description**: Design a function in Module A that contains `if-else` control structures with multiple `nop` instructions in both branches. Verify that when the function is called by Module B, the `nop` instructions do not alter the expected control flow or branch outcomes across module boundaries.

(assert_invalid
  (module
    (func $test
      (if (i32.const 1)
        (then
          (nop)
          (br 0)
        )
        (else
          (nop)
          (br 0)
        )
      )
    )
  )
  "Invalid control structure: branched to invalid depth"
)