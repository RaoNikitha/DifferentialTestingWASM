;; 7. Create a control flow within a `loop` where after certain `call` instructions, a `br` targets an incorrect label in an enclosing `block`, intending to see if this causes improper return handling and stack inconsistencies.

(assert_invalid
  (module
    (func $br_invalid_label (result i32)
      (block $outer
        (loop $inner
          (call $dummy)
          (br $outer)
        )
      )
      (i32.const 1)
    )
    (func $dummy)
  )
  "unknown label"
)