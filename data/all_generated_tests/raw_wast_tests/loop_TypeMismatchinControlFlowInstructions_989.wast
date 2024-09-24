;; Test 10: A `loop` within a `block` where branches inside the `loop` create a stack state with mixed types, but the `block` enclosing the `loop` expects a homogenous type upon exiting the `loop`.

(assert_invalid
  (module
    (func $mixed-stack-state
      (block (result i32)
        (loop (result i32)
          (br_if 0 (i32.const 1))
          (i32.const 2)
        )
        (drop)
      )
    )
  )
  "type mismatch"
)