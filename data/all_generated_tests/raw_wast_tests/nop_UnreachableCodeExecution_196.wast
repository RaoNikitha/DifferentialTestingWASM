;; Test 7: Use `nop` within a complex switch-case implementation where some cases lead to an `unreachable`. Confirm that none of the `nop` instructions affect reaching the `unreachable` in any of the cases.

(assert_invalid
  (module
    (func $complex_switch (param i32)
      (block
        (block (br_table 0 1 (local.get 0)) (nop))
        (br 1)
      )
      (unreachable)
    )
  )
  "br_table target mismatch"
)