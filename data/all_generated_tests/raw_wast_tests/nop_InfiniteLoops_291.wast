;; Test 2: Use `nop` within the loop and a `br_if` that skips the `nop` conditionally based on a dynamic condition. Check if the loop executes correctly without getting stuck.

(assert_malformed
  (module
    (func
      (loop
        (block
          (br_if 1 (i32.const 0))
          (nop)
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)