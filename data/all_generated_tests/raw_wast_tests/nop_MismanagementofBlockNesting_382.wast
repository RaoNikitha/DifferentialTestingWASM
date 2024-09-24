;; 3. **Test nested loops with intermittent `nop`:** Design nested loops interspersed with `nop` instructions and use `br` and `br_if` to jump between loop levels. This ensures that the `resetSig` method doesn't mismanage stack type expectations, leading to erroneous loop exits or continuations.

(assert_invalid
  (module
    (func $nested-loops (result i32)
      (loop
        (nop)
        (br 1)
      )
      (i32.const 1)
      (loop
        (nop)
        (br_if 1 (i32.const 0))
      )
      (i32.add)
    )
  )
  "type mismatch"
)