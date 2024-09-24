;; 2. A conditionally executed `unreachable` within an `if` block nested inside multiple `block` and `loop` structures. This ensures that the surrounding control flow remains intact and properly manages the nested structure.

(assert_invalid
  (module
    (func (block
            (loop
              (block
                (if (i32.const 1)
                  (then
                    (unreachable)
                  )
                )
                (i32.const 1)
                (i32.add)
              )
            )
          )
    )
  )
  "type mismatch"
)