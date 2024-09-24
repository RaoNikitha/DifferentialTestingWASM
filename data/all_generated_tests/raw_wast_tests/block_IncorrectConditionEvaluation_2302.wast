;; 3. Use a `block` with a `blocktype` that returns a specific value, including a `br_if` with a true condition but evaluated inverting the boolean. This evaluates if the correct branch is taken based on the condition’s correct evaluation.

(assert_invalid
  (module
    (func $block_with_br_if_invert (result i32)
      (block $label (result i32)
        (br_if $label (i32.const 0) (i32.eqz (i32.const 1)))
        (i32.const 42)
      )
    )
  )
  "type mismatch"
)