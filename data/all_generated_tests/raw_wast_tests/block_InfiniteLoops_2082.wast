;; 3. Implement a `block` with a `br_table` inside a `loop` targeting different blocks, checking if wizard_engine's switch-case pattern mishandles label indices, causing an infinite loop.

(assert_invalid
  (module
    (func
      (block $label0 (result i32)
        (loop $label1
          (br_table $label0 $label1 (i32.const 0))
        )
      )
    )
  )
  "type mismatch"
)