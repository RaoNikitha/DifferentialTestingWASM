(assert_invalid
  (module
    (memory 0)
    (func $type-condition-empty-in-memory.grow
      (memory.grow (if(then))) (drop)
    )
  )
  "type mismatch"
)