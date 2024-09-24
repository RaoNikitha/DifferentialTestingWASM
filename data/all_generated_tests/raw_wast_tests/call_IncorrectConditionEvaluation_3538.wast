;; 7. **Test Description**: Develop a function with a `br_if` meant to exit a series of nested loops when a counter reaches a threshold. An always true evaluation condition leads to unexpected premature exits, uncovering different outcomes.

(assert_invalid
  (module
    (func (export "nested-br_if")
      (local i32)
      (block 
        (loop
          (local.set 0 (i32.add (local.get 0) (i32.const 1)))
          (br_if 1 (i32.const 1)) 
          (loop
            (local.set 0 (i32.add (local.get 0) (i32.const 1)))
            (br_if 1 (i32.const 1))
          )
        )
      )
    )
  )
  "type mismatch"
)