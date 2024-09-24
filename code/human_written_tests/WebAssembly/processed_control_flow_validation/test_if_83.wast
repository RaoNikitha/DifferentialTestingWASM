(assert_invalid
  (module
    (func $type-condition-empty-in-br
      (i32.const 0)
      (block (br 0 (if(then))) (drop))
    )
  )
  "type mismatch"
)