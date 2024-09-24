;; 5. **Test 5**: Insert multiple `nop` instructions within a function containing deeply nested `if`, `block`, and `loop` instructions. Ensure the nested structure is maintained correctly and that flow control instructions refer to the accurate block/loop depth.

(assert_invalid
  (module
    (func $test-nested
      (block
        (loop
          (block
            (if (i32.const 1)
              (then
                nop
                (br 2)
              )
              (else
                nop
              )
            )
            nop
            (br 1)
          )
          nop
        )
      )
    )
  )
  "type mismatch"
)