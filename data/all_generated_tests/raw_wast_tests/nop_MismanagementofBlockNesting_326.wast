;; 7. **Test 7**: Test nested `block`, `loop`, and `if` structures where `nop` is used just before `end` instructions to ensure that the `end` instructions correctly close the intended control structure without interference from `nop`.

(assert_invalid
  (module
    (func
      (block (nop) (end))
      (loop (nop) (end))
      (if (i32.const 1) (then (nop) (end)) (else (nop) (end)))
    )
  )
  "invalid block type"
)