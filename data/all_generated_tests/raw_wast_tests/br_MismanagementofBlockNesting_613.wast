;; 4. **Test with Forward Branches in Complex Nesting:**    Design a scenario where `br` instructions are used in complex nested structures to target `block` and `if` constructs at varying depths. This assesses whether forward branches resume execution properly after the `end` of the targeted block.

(assert_invalid
  (module 
    (func 
      (block
        (loop
          (if (i32.const 1)
            (then (br 1))
          )
          (br 2)
        )
      )
    )
  )
  "unknown label"
)