;; 7. **Test Mixed Control Flow**: A `block` containing `if`, `else`, and `loop` sections, each with `br_if` potentially leading to `unreachable`. This assures the correct processing of mixed conditional and control structures.

(assert_invalid
  (module
    (func $mixed-control-flow
      (block
        (if (i32.const 1)
          (then
            (loop
              (br_if 0 (i32.const 0)) 
              (unreachable)
            )
          )
          (else
            (block
              (br_if 0 (i32.const 0))
              (unreachable)
            )
          )
        )
      )
    )
  )
  "type mismatch"
)