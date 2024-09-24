;; 9. A 'loop' containing a conditionally accessible `return` where conditional control should toggle via `br_if` and then `br`. Mismanagement in letting the loop run infinitely due to improper control flow in `return`.

(assert_invalid
  (module
    (func $loop-infinite-with-return
      (block
        (loop
          (br_if 0 (i32.eqz (i32.const 1)))  
          (br 1)
        )
        (return (i32.const 0))
      )
    )
  )
  "type mismatch"
)