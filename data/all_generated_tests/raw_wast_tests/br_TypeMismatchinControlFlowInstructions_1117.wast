;; 8. **Test Description:**    - Create a `loop` accepting an `f32` as input.    - Within conditions before the loop, push a `br` pointing to the loop start, erroneously providing an `i32`.    - This test case verifies type adherence when restarting a loop against type instructions.

(assert_invalid
  (module
    (func $incorrect-br-loop-type
      (block
        (loop (param f32)
          (i32.const 0)
          (br 0)
        )
      )
    )
  )
  "type mismatch"
)